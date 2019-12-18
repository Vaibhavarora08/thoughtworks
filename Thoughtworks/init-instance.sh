#tomact install

cd /opt/
wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.53/bin/apache-tomcat-7.0.53.tar.gz
tar -zxvf apache-tomcat-7.0.53.tar.gz
rm apache-tomcat-7.0.53.tar.gz
cd /opt/apache-tomcat-7.0.53/bin/
./startup.sh


#Java Install

cd /opt/
sudo yum install java-1.8.0-openjdk
java -version