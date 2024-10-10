
run: install-taskjuggler
    cd plans && tj3 vsekai.tjp

check-ruby:
    @if command -v ruby >/dev/null 2>&1; then \
        echo "Ruby is installed."; \
    else \
        echo "Ruby is not installed. Please install Ruby to continue."; \
        exit 1; \
    fi

install-taskjuggler: check-ruby
    @echo "Checking if TaskJuggler is installed..."
    @gem list taskjuggler -i > /dev/null || (echo "Installing TaskJuggler..."; gem install taskjuggler)
