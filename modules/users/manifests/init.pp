/*

Define all your users here.

*/
import "defines/*"

class users {

    sshuser { "yourusername":
        name => "yourusername",
        gid  => "yourusername",
        groups => ["sudo", "admin"],
        ssh_public_key => "AAAABANAACAAC2AAAAAAAAAAAQEAASFARAD19CJI7CA7ABHGE9UHBYHQTDIRAzfQ7LzjP0H8AeX3Z+2xCJgJeRUWr/FJDIFVlBLhVk2otKVAdvfg7e+45ZB2p5JHWpe3/CU+igvEkIX7ym0lUOTkfr5dtyJoMRbarU6GZEfe1+FwFlkDOuxkKrXVw2Vv6Tjo5wtzFBLzHV+Q8j6iBbjq4FvPMqzsNEZIfANCO9aXR/bXD5vPzgIYUBW9BRtMIXHgAfLYG1FDBlqbWnYKwRiDD2e000riC5SekS8TsVOfWP0G20DVooBlXb1coVMKx2UG1g9LePeoGzrQycZ/J7nMXXSycb+by5lThPM3hMNZe5Gl594nBw==",
    }
    
    # authorize another ssh key
    ssh_authorized_key { "yourusername@sunrise":  # key_name
       ensure => 'present', 
       key => "AAAAB3NzaC1kc3MAAACBAPLDP6Q7j9QaRQ+WW7HDb6FGfGpPLyAb2I5gQkIY0It8AAAAAAAALBma9M7LIP6KopZKdw03ujRFRLk8YwPBrz8BH39zVzcATPRZwfdvEzLVJ9u+fhzOU3tawsBqszmnRzTQJ5RUnLI1Y8trRT0Ps7Wm8mYdnfzk9EHO0+nr/bHAAAAFQD+WMiDXyyNVxvcUmXjaw0c7z+T/wAAAIEA1YsP+PwPMNXbNP2h/ndfANlMilyD2xT7ZrLwW2DHH/TghBmKQZmgmFsCPOG0PSI5xA8BHuaQoo4xSsZ+/7zhe55RfJQXupYWhztwmAi/9vU5aW0+ln2HXMnq3kmp8aBjlS2vBWBTBA7e+64nbIwDxYQRryYi71FPGsJTLDkifeQAAACAebxhGVtlPh9Rnf+HcOFm8ypVu7UY/tYrWo75HDuozs5W29nqgtmQccynUI/uX9LBlxC194UJofLGI40tJo0neLsDJHiKfjtzAZH2VL6a01sb5MsqX/tjFKCjWun00ScpjQbLwegTp7KJYccK1rz+RJxxPrL1FI7Dh30wYu9389Q=", 
       type => "dsa", 
       user => "yourusername", 
       require => File["/home/yourusername/.ssh"],
    }
    
}