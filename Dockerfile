FROM klikatech/teamcity-agent-base

MAINTAINER Eugene Volchek <evolchek@klika-tech.com>

USER root

RUN apt-get update \
	&& apt-get install -y rsync bzip2 ruby-full build-essential ant \
		php5-common php5-cli php5-curl php5-memcached php5-mysql php5-gd \
	&& curl -sL https://deb.nodesource.com/setup | bash - \
	&& apt-get install -y nodejs \
	&& npm install -g bower \
	&& npm install -g grunt-cli \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& gem install sass \
	&& gem install compass \
	&& gem install jekyll \
	&& apt-get purge -y build-essential \
	&& apt-get -y autoremove && apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
USER teamcity
