FROM mcandre/docker-pyenv

RUN apt-get update
RUN apt-get install -y language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8

RUN cd /root/.pyenv/plugins/python-build/../.. && git pull && cd -
RUN pyenv install miniconda3-3.19.0 && pyenv local miniconda3-3.19.0
RUN conda install -y numpy scikit-learn numpy scipy chainer matplotlib

RUN mkdir /root/anime_recommend/
WORKDIR /root/anime_recommend/

ENV LANG ja_JP.UTF-8
CMD ./exe/recommend.sh
