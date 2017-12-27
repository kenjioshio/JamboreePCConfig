# Version="1.0.0.0"
# Product="" 　　　
# Copyright="Kenji Oshio" 
# Company=""

Configuration SetEnvironmentVariable
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration    
    Node localhost
    {
        Environment EnvironmentVariable_Path
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Name = "Path"
            Value = "%systemroot%\System32\WindowsPowerShell\v1.0\;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\ProgramData\chocolatey\bin;C:\Program Files\TortoiseSVN\bin;C:\Program Files\NUnit 2.6.4\bin;C:\Program Files\Git\cmd;C:\Program Files\Java\jdk1.8.0_152\bin;"
        }

        Environment EnvironmentVariable_Java_Home
        {
            Ensure = "Present"  # You can also set Ensure to "Absent"
            Name = "JAVA_HOME"          
            Value = "C:\Program Files\Java\jdk1.8.0_152"
        }

    }
}

SetEnvironmentVariable -OutputPath .\EnvironmentVariable
Start-DscConfiguration -Wait -Force -Verbose -Path .\EnvironmentVariable -ComputerName Localhost