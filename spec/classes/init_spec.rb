require 'spec_helper'

describe 'singularity' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge(concat_basedir: '/dne')
      end
      # TODO: Hack until epel module supports EPEL8
      let(:pre_condition) do
        if facts[:os]['release']['major'].to_i >= 8
          "class { 'epel': epel_gpg_managed => false }"
        end
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to create_class('singularity') }

      it { is_expected.to contain_class('singularity::install').that_comes_before('Class[singularity::config]') }
      it { is_expected.to contain_class('singularity::config') }

      shared_examples 'singularity::install' do
        it do
          is_expected.to contain_package('singularity').only_with(ensure: 'present',
                                                                  name: 'singularity')
        end
      end

      context 'singularity::config' do
        it do
          is_expected.to contain_file('singularity.conf').with(ensure: 'file',
                                                               path: '/etc/singularity/singularity.conf',
                                                               owner: 'root',
                                                               group: 'root',
                                                               mode: '0644')
        end

        it 'has default singularity.conf contents' do
          verify_exact_contents(catalogue, 'singularity.conf', [
                                  'allow setuid = yes',
                                  'max loop devices = 256',
                                  'allow pid ns = yes',
                                  'config passwd = yes',
                                  'config group = yes',
                                  'config resolv_conf = yes',
                                  'mount proc = yes',
                                  'mount sys = yes',
                                  'mount dev = yes',
                                  'mount devpts = yes',
                                  'mount home = yes',
                                  'mount tmp = yes',
                                  'mount hostfs = no',
                                  'bind path = /etc/localtime',
                                  'bind path = /etc/hosts',
                                  'user bind control = yes',
                                  'enable overlay = try',
                                  'enable underlay = yes',
                                  'mount slave = yes',
                                  'sessiondir max size = 16',
                                  'allow container squashfs = yes',
                                  'allow container extfs = yes',
                                  'allow container dir = yes',
                                  'always use nv = no',
                                  'root default capabilities = full',
                                  'memory fs type = tmpfs',
                                  'shared loop devices = no',
                                ])
        end

        it { is_expected.not_to contain_file('/etc/subuid') }
        it { is_expected.not_to contain_file('/etc/subgid') }

        context 'with namespace_users defined' do
          let(:params) do
            {
              namespace_users: ['foo', 'bar'],
            }
          end

          it do
            is_expected.to contain_file('/etc/subuid').with(ensure: 'file',
                                                            owner: 'root',
                                                            group: 'root',
                                                            mode: '0644')
          end
          it 'has /etc/setuid contents' do
            verify_exact_contents(catalogue, '/etc/subuid', [
                                    'foo:65537:65536',
                                    'bar:131074:65536',
                                  ])
          end
          it do
            is_expected.to contain_file('/etc/subgid').with(ensure: 'file',
                                                            owner: 'root',
                                                            group: 'root',
                                                            mode: '0644')
          end
          it 'has /etc/setgid contents' do
            verify_exact_contents(catalogue, '/etc/subgid', [
                                    'foo:65537:65536',
                                    'bar:131074:65536',
                                  ])
          end
        end
      end
    end # end context
  end # end on_supported_os loop
end # end describe
