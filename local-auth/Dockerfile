FROM hyperledger/composer-rest-server:0.19.5

RUN npm install --production loopback-connector-mongodb passport-local && \
    npm cache clean --force && \
    ln -s node_modules .node_modules && ls 