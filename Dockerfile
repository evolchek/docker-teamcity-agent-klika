FROM klikatech/teamcity-agent-base

MAINTAINER Eugene Volchek <evolchek@klika-tech.com>

USER root

RUN apt-get update \
	&& apt-get install -y rsync bzip2 ruby-full build-essential ant \
		php5-common php5-cli php5-curl php5-memcached php5-mysql php5-gd \
		zip nodejs groff less python python-pip apt-transport-https \
	&& curl -sL https://deb.nodesource.com/setup | bash - \
	&& curl -sL https://deb.nodesource.com/setup_5.x | bash - \
	&& echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
	&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 \
	&& apt-get update \
	&& apt-get install -y nodejs sbt \
	&& npm install -g npm@next \
	&& npm install -g bower \
	&& npm install -g grunt-cli \
	&& npm install -g webpack \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& gem install sass \
	&& gem install compass \
	&& gem install jekyll \
	&& curl -sSL https://get.docker.com/ | sh \
	&& pip install awscli \
	&& apt-get -y autoremove && apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER teamcity
