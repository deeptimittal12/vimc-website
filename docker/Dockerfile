FROM jekyll/builder:3.3.1
ENV USER_BUNDLE_CACHE=$JEKYLL_DATA_DIR/_bundle
RUN mv /usr/local/bundle /usr/local/bundle_src && \
        ln -s $USER_BUNDLE_CACHE /usr/local/bundle
COPY build-site.sh /usr/local/bin/build-site.sh
