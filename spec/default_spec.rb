require 'spec_helper'

describe 'deis::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it 'serverinclude apt::default' do
    expect(chef_run).to include_recipe 'apt::default'
  end

  it 'serverinstall fail2ban' do
    expect(chef_run).to install_package('fail2ban')
  end

  it 'serverinstall git' do
    expect(chef_run).to install_package('git')
  end

  it 'serverinstall make' do
    expect(chef_run).to install_package('make')
  end

  it 'serverinstall ntp' do
    expect(chef_run).to install_package('ntp')
  end

  it 'servernot remove an old macaddr gem before reinstalling' do
    expect(chef_run).to install_chef_gem('macaddr').with(version: '1.6.1')
  end

  it 'serverinstall etcd gem' do
    expect(chef_run).to install_chef_gem('etcd').with(version: '0.0.6')
  end

  it 'serverinclude docker::default' do
    expect(chef_run).to include_recipe('docker::default')
  end

  it 'servercreate deis user' do
    expect(chef_run).to create_user(chef_run.node['deis']['username'])
  end

  it 'servercreate directory' do
    expect(chef_run).to create_directory(chef_run.node['deis']['dir'])
  end

  it 'serversetup sudo for deis user' do
    expect(chef_run).to install_sudo(chef_run.node['deis']['username'])
  end

  it 'servercreate log directory' do
    expect(chef_run).to create_directory(chef_run.node['deis']['log_dir'])
  end
end
