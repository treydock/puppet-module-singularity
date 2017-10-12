require 'spec_helper'

describe 'singularity' do
  on_supported_os({
    :supported_os => [
      {
        "operatingsystem" => "RedHat",
        "operatingsystemrelease" => ["6", "7"],
      }
    ]
  }).each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :concat_basedir => '/dne',
        })
      end

      case facts[:operatingsystemrelease]
      when /^7/
        facts[:operatingsystemrelease] = '7.3'
        enable_overlay = 'yes'
      else
        enable_overlay = 'no'
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to create_class('singularity') }
      it { is_expected.to contain_class('singularity::params') }

      it { is_expected.to contain_class('singularity::install').that_comes_before('Class[singularity::config]') }
      it { is_expected.to contain_class('singularity::config') }

      shared_context "singularity::install" do
        it do
          is_expected.to contain_package('singularity').only_with({
            :ensure => 'present',
            :name   => 'singularity',
          })
        end
      end

      context "singularity::config" do
        it do
          is_expected.to contain_file('singularity.conf').with({
            :ensure  => 'file',
            :path    => '/etc/singularity/singularity.conf',
            :owner   => 'root',
            :group   => 'root',
            :mode    => '0644',
          })
        end

        it 'should have default singularity.conf contents' do
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
            "enable overlay = #{enable_overlay}",
            'mount slave = yes',
            'sessiondir max size = 16',
            'allow container squashfs = yes',
            'allow container extfs = yes',
            'allow container dir = yes',
          ])
        end
      end

    end # end context
  end # end on_supported_os loop
end # end describe
