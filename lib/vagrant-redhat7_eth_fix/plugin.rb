require "vagrant"

module VagrantPlugins
  module GuestRedhat7EthFix
    class Plugin < Vagrant.plugin('2')
      name "Redhat7 Eth Fix"
      description "Fix Redhat 7 Non Consistent Nic Naming"

      guest('rhel7_eth', 'redhat') do
        require_relative 'guest'
        Guest
      end

      guest_capability('rhel7_eth', 'flavor') do
        require_relative "flavor"
        Flavor
      end
    end
  end
end