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
	sudo apt-get install -y -qq openjdk-8-jdk
	wget http://archive.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
	sudo tar -xzvf apache-maven-3.3.3-bin.tar.gz -C /opt
	rm apache-maven-3.3.3-bin.tar.gz
	sudo bash -c 'echo M3=/opt/apache-maven-3.3.3 >> /etc/profile.d/env_vars.sh'
	sudo bash -c 'echo M3_HOME=\$$M3 >> /etc/profile.d/env_vars.sh'
	sudo bash -c 'echo PATH=\$$PATH:/opt/google/google_appengine:/usr/local/share/google/google-cloud-sdk/bin:\$$M3/bin >> /etc/profile.d/env_vars.sh'
	sudo bash -c 'echo PATH=\$$PATH:/opt/google/appengine-java-sdk-1.9.27/bin:/usr/local/share/google/google-cloud-sdk/bin:\$$M3/bin >> /etc/profile.d/env_vars.sh'
	echo "source '/usr/local/share/google/google-cloud-sdk/completion.bash.inc'" >> ~/.bashrc
	

