#!/bin/bash

        #Author : Excellent
        #Date : 12-Jun-2022

##-------------- Installing Jenkins -----------------
echo "Jenkins Application installation will begin now"
sleep 3

#installing java
echo "Installing Java, please wait ...."
sleep 3
yum install java-1.8.0-openjdk-devel -y
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Java-1.8.0-openjdk-devel has been Installed Successfully"
        else
        sleep 2
        echo "Java-1.8.0-openjdk-devel failed to Install"
        exit 2
fi
sleep 3

#installing wget
echo "Installing Wget package, Please wait ...."
sleep 3
yum install wget -y
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Wget has been Installed Successfully"
        else
        sleep 2
        echo "Wget failed to Install"
        exit 2
fi
sleep 3

#enabling Jenkins Repository
echo "Enabling Jenkins Repository, please wait ...."
sleep 3
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Jenkins Repository has been Enabled"
        else
        sleep 2
        echo "Jenkins Repository failed to Enable"
        sleep 2
        echo "Please modify script"
exit 2
fi
sleep 3
#disable key check on the repo
echo "Disabling the key on the Jenkins repository, Please wait ...."
sleep 3
sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Key for Jenkins Repo has be Disabled"
        else
        sleep 2
        echo "Key for Jenkins Repo failed to Disable"
        sleep 3
        echo "Please modify script"
exit 2
fi
sleep 3
#installing jenkins
echo "Installing Jenkins, Please wait ...."
sleep 3
yum install jenkins -y
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Jenkins has been Installed Successfully"
        else
        sleep 2
        echo "Jenkins failed to Install"
exit 2
fi
sleep 3

#start the jenkins application
echo "Starting the Jenkins Application, Please wait ...."
sleep 3
systemctl start jenkins
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Jenkins applications is active(running)"
        else
        sleep 2
        echo "Jenkins application is not active(not running)"
        exit 2
fi
sleep 3

#enable Jenkins to start on system boot
echo "Enabling Jenkins on system boot, Please wait ...."
systemctl enable jenkins
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Jenkins has been Enabled on system boot"
        else
        sleep 2
        echo "Jenkins has not been enabled on system boot"
        exit 2
fi
sleep 3

#adjust firewall
echo "Activating Firewalld, Please wait ...."
systemctl start firewalld
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Firewalld is active(running)"
        else
        sleep 2
        echo "Firewalld is not active(not running)"
fi
sleep 3
echo "Enabling Firwalld, Please wait ...."
systemctl enable firewalld
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Firewalld is enabled on system"
        else
        sleep 2
        echo "Firewalld is not enabled on system"
fi
echo "Adjusting firewall, Please wait ...."
sleep 3
firewall-cmd --permanent --zone=public --add-port=8080/tcp
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Firewalld has been Adjusted"
        else
        sleep 2
        echo "Firewalld has not been Adjusted"
fi
sleep 3
firewall-cmd --reload
if [ $? -eq 0 ]
        then
        sleep 2
        echo "Firewalld has been Adjusted"
        else
        sleep 2
        echo "Firewalld has not been Adjusted"
fi
sleep 3
#admin passwd
echo "Displaying Jenkins Admin Password below, Please wait ...."
sleep 3
cat /var/lib/jenkins/secrets/initialAdminPassword
sleep 3
echo "Please proceed to jenkins link: http://your_ip_or_domain:8080"
sleep 2
echo "Login with Admin Passwd listed above"
sleep 2
echo "Install Suggested Plugins"
sleep 2
echo "Create first Admin User using information below:"
sleep 2
echo "Username: utrains"
echo "Password: school1"
sleep 2
echo "On the 'Instance Configuration' page, press 'Save and Finish'"
sleep 2
echo "You may now begin using Jenkins"