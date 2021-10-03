FROM rustlang/rust:nightly


ARG PROFILE=release
WORKDIR /weatherwasm

# Upcd dates core parts
RUN apt-get update -y && \
	apt-get install -y cmake pkg-config libssl-dev git gcc build-essential clang libclang-dev vim

# Install rust wasm. Needed for substrate wasm engine
RUN rustup target add wasm32-unknown-unknown
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm"
# RUN echo "[ -s $HOME/.nvm/nvm.sh ] && \. $HOME/.nvm/nvm.sh" >> $HOME/.shrc  # This loads nvm
# RUN [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
RUN bash $HOME/.nvm/install.sh 
RUN bash -i -c 'nvm ls-remote'
RUN bash -i -c 'nvm install stable'
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
RUN git clone https://github.com/byteshiva/rust-webassembly-weather-report.git
EXPOSE 8080
