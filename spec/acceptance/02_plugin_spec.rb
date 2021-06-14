require 'spec_helper_acceptance'

describe 'singularity::plugin' do
  context 'installs log plugin' do
    it 'runs successfully' do
      setup_pp = <<-EOS
      class { 'rsyslog::client':
        log_local  => true,
        log_remote => false,
      }
      EOS
      pp = <<-EOS
      class { 'singularity':
        version        => '3.7.1',
        install_method => 'source',
        # Avoid /etc/localtime which may not exist in minimal Docker environments
        bind_paths     => ['/etc/hosts'],
      }
      singularity::plugin { 'github.com/sylabs/singularity/log-plugin':
        source_dir => 'examples/plugins/log-plugin',
      }
      EOS

      apply_manifest(setup_pp, catch_failures: true)
      apply_manifest(setup_pp, catch_failures: true)
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
      on hosts, 'find /var/log -type f -exec rm -f {} \;'
      on hosts, 'systemctl restart rsyslog'
      sleep 5
    end

    describe command('singularity pull /tmp/lolcow.sif library://lolcow ; singularity run /tmp/lolcow.sif') do
      its(:exit_status) { is_expected.to eq(0) }
    end

    describe command('grep -R singularity /var/log/') do
      its(:stdout) { is_expected.to include('lolcow') }
    end
  end

  context 'reinstalls log plugin during upgrade' do
    it 'runs successfully' do
      setup_pp = <<-EOS
      class { 'rsyslog::client':
        log_local  => true,
        log_remote => false,
      }
      EOS
      pp = <<-EOS
      class { 'singularity':
        version        => '3.7.4',
        install_method => 'source',
        # Avoid /etc/localtime which may not exist in minimal Docker environments
        bind_paths     => ['/etc/hosts'],
      }
      singularity::plugin { 'github.com/sylabs/singularity/log-plugin':
        source_dir => 'examples/plugins/log-plugin',
      }
      EOS

      on hosts, 'find /var/log -type f -exec rm -f {} \;'
      on hosts, 'systemctl restart rsyslog'
      apply_manifest(setup_pp, catch_failures: true)
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe command('singularity pull /tmp/lolcow.sif library://lolcow ; singularity run /tmp/lolcow.sif') do
      its(:exit_status) { is_expected.to eq(0) }
    end

    describe command('grep -R singularity /var/log/') do
      its(:stdout) { is_expected.to include('lolcow') }
    end
  end
end
