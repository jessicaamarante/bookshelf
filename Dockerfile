FROM ruby:3.2.2

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"] 
# cmd é para execução e eh ignorado dentro do build da imagem

WORKDIR /usr/src/app
# . . copia tudo da raiz do docker file para o diretorio atual
COPY . .
RUN bundle install
RUN apt-get update -qq && apt-get install -y nodejs && apt-get install -y yarn nodejs

ENTRYPOINT ["./entrypoint.sh"]
