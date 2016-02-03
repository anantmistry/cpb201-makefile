all:
		yes | sudo gcloud components update
		yes | sudo gcloud components update beta
		yes | sudo gcloud components update kubectl
		sudo apt-get install -y -qq unzip
		wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.27.zip
		sudo unzip -qq -d /opt/google google_appengine_1.9.27.zip
		rm google_appengine_1.9.27.zip
		wget https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.27.zip
		sudo unzip -qq -d /opt/google appengine-java-sdk-1.9.27.zip
		rm appengine-java-sdk-1.9.27.zip
		echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list
		echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
		echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
		sudo apt-get -y -qq update
		sudo apt-get install -y -qq oracle-java8-installer
		sudo apt-get install -y -qq maven
		sudo bash -c 'echo M3=/opt/apache-maven-3.3.3 >> /etc/profile.d/env_vars.sh'
		sudo bash -c 'echo M3_HOME=\$$M3 >> /etc/profile.d/env_vars.sh'
		sudo bash -c 'echo PATH=\$$PATH:/opt/google/google_appengine:/usr/local/share/google/google-cloud-sdk/bin:\$$M3/bin >> /etc/profile.d/env_vars.sh'
		sudo bash -c 'echo PATH=\$$PATH:/opt/google/appengine-java-sdk-1.9.27/bin:/usr/local/share/google/google-cloud-sdk/bin:\$$M3/bin >> /etc/profile.d/env_vars.sh'
		echo "source '/usr/local/share/google/google-cloud-sdk/completion.bash.inc'" >> ~/.bashrc
                                                                                                                    
