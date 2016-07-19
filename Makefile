# customization

PACKAGE_NAME = brickrouge/Calendar
PACKAGE_VERSION = 3.0

# do not edit the following lines

usage:
	@echo "test:  Runs the test suite.\ndoc:   Creates the documentation.\nclean: Removes the documentation, the dependencies and the Composer files."

vendor:
	@composer install

update:
	@composer update

autoload: vendor
	@composer dump-autoload

test: vendor
	@phpunit

test-coverage: vendor
	@mkdir -p build/coverage
	@phpunit --coverage-html build/coverage

doc: vendor
	@mkdir -p build/docs
	@apigen generate \
	--source lib \
	--destination build/docs/ \
	--title "$(PACKAGE_NAME) $(PACKAGE_VERSION)" \
	--template-theme "bootstrap"

clean:
	@rm -fR .sass-cache
	@rm -fR build
	@rm -fR vendor
	@rm -f composer.lock
	@rm -fR node_modules

.PHONE: all autoload clean update test test-coverage usage watch
