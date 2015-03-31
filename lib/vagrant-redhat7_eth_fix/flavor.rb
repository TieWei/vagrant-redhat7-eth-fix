
module VagrantPlugins
  module GuestRedhat7EthFix
    class Flavor
      def self.flavor(machine)
        # Read the version file
        output = ""
        machine.communicate.sudo("cat /etc/redhat-release") do |type, data|
          output += data if type == :stdout
        end
        output.chomp!

        # Detect various flavors we care about
        if output =~ /(CentOS|Red Hat Enterprise|Scientific) Linux( .+)? release 7/i
          nics_string = ""
          machine.communicate.sudo("ls -1 /sys/class/net/") do |type, data|
            nics_string += data if type == :stdout
          end
          nics_string.chomp!
          nics = nics_string.split("\n")
          if nics.count{|nic| nic =~ /^eth\d+/i} > 0
            return :rhel_7_eth
          else
            return :rhel_7
          end
        else
          return :rhel
        end
      end
    end
  end
end