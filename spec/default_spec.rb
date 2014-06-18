describe 'dotpromo-ruby-box::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before :each do
    stub_command('which sudo').and_return('/usr/bin/sudo')
    stub_command('bash -c "source /home/deployer/.rvm/scripts/rvm && type rvm | cat | head -1 | grep -q \'^rvm is a function$\'"').and_return(true)
  end

  %w(git curl htop atop screen vim).each do |k|
    it "installs #{k}" do
      expect(chef_run).to install_package(k)
    end
  end
  %w(users rvm::user).each do |k|
    it "includes the `#{k}` recipe" do
      expect(chef_run).to include_recipe(k)
    end
  end
  it 'should manage user with users' do
    expect(chef_run).to create_users_manage('deployer')
  end
end
