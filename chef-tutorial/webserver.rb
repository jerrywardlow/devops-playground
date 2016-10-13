apt_update 'Update the apt cache daily' do
  frequency 86400
  action :periodic
end

package 'apache2'
