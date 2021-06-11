require 'spec_helper'

describe 'singularity::plugin' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let :title do
        'github.com/sylabs/singularity/log-plugin'
      end

      let :params do
        { source_dir: 'examples/plugins/log-plugin' }
      end

      let(:pre_condition) { "class { 'singularity': install_method => 'source' }" }

      it do
        is_expected.to contain_exec('singularity-plugin-compile-github.com/sylabs/singularity/log-plugin').with(
          path: '/usr/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin',
          environment: ['HOME=/root'],
          command: 'singularity plugin compile /opt/singularity-3.7.1/examples/plugins/log-plugin',
          creates: '/opt/singularity-3.7.1/examples/plugins/log-plugin/log-plugin.sif',
          require: 'Class[Singularity::Install::Source]',
        )
      end

      it do
        is_expected.to contain_exec('singularity-plugin-install-github.com/sylabs/singularity/log-plugin').with(
          path: '/usr/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin',
          command: 'singularity plugin install /opt/singularity-3.7.1/examples/plugins/log-plugin/log-plugin.sif',
          unless: "singularity plugin list | grep 'github.com/sylabs/singularity/log-plugin'",
          require: 'Exec[singularity-plugin-compile-github.com/sylabs/singularity/log-plugin]',
        )
      end

      it do
        is_expected.to contain_exec('singularity-plugin-enable-github.com/sylabs/singularity/log-plugin').with(
          path: '/usr/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin',
          command: 'singularity plugin enable github.com/sylabs/singularity/log-plugin',
          unless: "singularity plugin list | grep 'github.com/sylabs/singularity/log-plugin' | grep yes",
          require: 'Exec[singularity-plugin-install-github.com/sylabs/singularity/log-plugin]',
        )
      end

      context 'when source_dir is absolute path' do
        let(:params) { { source_dir: '/foobar' } }

        it do
          is_expected.to contain_exec('singularity-plugin-compile-github.com/sylabs/singularity/log-plugin').with(
            command: 'singularity plugin compile /foobar',
          )
        end
      end

      context 'when ensure => absent' do
        let(:params) { { ensure: 'absent' } }

        it do
          is_expected.to contain_exec('singularity-plugin-uninstall-github.com/sylabs/singularity/log-plugin').with(
            path: '/usr/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin',
            command: 'singularity plugin uninstall github.com/sylabs/singularity/log-plugin',
            onlyif: "singularity plugin list | grep 'github.com/sylabs/singularity/log-plugin'",
          )
        end
      end
    end
  end
end
