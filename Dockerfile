#
# Docker file for ubuntu java 7
#

FROM mcpayment/ubuntu1404

MAINTAINER tech.devops@mcpayment.com

RUN  sudo apt-get install -y wget

# Download Java from oracle
RUN \
    wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"   "http://download.oracle.com/otn-pub/java/jdk/7u72-b14/server-jre-7u72-linux-x64.tar.gz"

# Extract Java files
RUN sudo tar -xf server-jre-7u72-linux-x64.tar.gz -C /tmp/

# Install Java
RUN \
   sudo apt-get update && \
   mkdir -p /usr/local/java && \
   cp /tmp/jdk*/ /usr/local/java -r && \
   cd /usr/local/java && \
   sudo chown -R root:root jdk1.7.0_72 && \
   sudo apt-get install -y java-common && \
   sudo mkdir /usr/lib/jvm/ && \
   cd /usr/lib/jvm/ && \
   sudo ln -s /usr/local/java/jdk1.7.0_72 /usr/lib/jvm/java-7-oracle-amd64 && \
   cd /usr/lib/jvm/ && \
   sudo apt-get install -y default-jre-headless && \
   sudo ln -s java-7-oracle-amd64 default-java && \
   sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/java" 3000 && \
   sudo update-alternatives --install "/usr/bin/keytool" "keytool" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/keytool" 3000 && \
   sudo update-alternatives --install "/usr/bin/orbd" "orbd" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/orbd" 3000 && \
   sudo update-alternatives --install "/usr/bin/pack200" "pack200" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/pack200" 3000 && \
   sudo update-alternatives --install "/usr/bin/unpack200" "unpack200" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/unpack200" 3000 && \
   sudo update-alternatives --install "/usr/bin/rmid" "rmid" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/rmid" 3000 && \
   sudo update-alternatives --install "/usr/bin/policytool" "policytool" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/policytool" 3000 && \
   sudo update-alternatives --install "/usr/bin/rmiregistry" "rmiregistry" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/rmiregistry" 3000 && \
   sudo update-alternatives --install "/usr/bin/servertool" "servertool" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/servertool" 3000 && \
   sudo update-alternatives --install "/usr/bin/tnameserv" "tnameserv" "/usr/lib/jvm/java-7-oracle-amd64/jre/bin/tnameserv" 3000 && \
   sudo update-alternatives --install "/usr/bin/jexec" "jexec" "/usr/lib/jvm/java-7-oracle-amd64/jre/lib/jexec" 3000 && \
   sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-7-oracle-amd64/bin/javac" 3000 && \
   sudo touch /usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "name=java-7-oracle-amd64">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "alias=java-7-oracle-amd64">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "priority=3000">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "section=non-free">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre java /usr/lib/jvm/java-7-oracle-amd64/jre/bin/java">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre keytool /usr/lib/jvm/java-7-oracle-amd64/jre/bin/keytool">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre pack200 /usr/lib/jvm/java-7-oracle-amd64/jre/bin/pack200">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre unpack200 /usr/lib/jvm/java-7-oracle-amd64/jre/bin/unpack200">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre rmid /usr/lib/jvm/java-7-oracle-amd64/jre/bin/rmid">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre rmiregistry /usr/lib/jvm/java-7-oracle-amd64/jre/bin/rmiregistry">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre orbd /usr/lib/jvm/java-7-oracle-amd64/jre/bin/orbd">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre servertool /usr/lib/jvm/java-7-oracle-amd64/jre/bin/servertool">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre tnameserv /usr/lib/jvm/java-7-oracle-amd64/jre/bin/tnameserv">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre jexec /usr/lib/jvm/java-7-oracle-amd64/jre/lib/jexec">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jre policytool /usr/lib/jvm/java-7-oracle-amd64/jre/bin/policytool">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo echo "jdk javac /usr/lib/jvm/java-7-oracle-amd64/bin/javac">>/usr/lib/jvm/.java-7-oracle-amd64.jinfo && \
   sudo update-java-alternatives  -s java-7-oracle-amd64 && \
   sudo echo "PATH=\"\$JAVA_HOME/bin:\$JRE_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"" >>/etc/environment && \
   sudo echo "JAVA_HOME=/usr/lib/jvm/default-java">>/etc/profile && \
   sudo echo "JRE_HOME=/usr/lib/jvm/default-java">>/etc/profile && \
   sudo echo "PATH=\$JRE_HOME/bin:\$JAVA_HOME/bin:\$PATH">>/etc/profile && \
   sudo echo "export JAVA_HOME">>/etc/profile && \
   sudo echo "export JRE_HOME">>/etc/profile && \
   sudo echo "export PATH"

# Setup ENV variables
ENV JAVA_HOME /usr/lib/jvm/default-java
ENV JRE_HOME /usr/lib/jvm/default-java