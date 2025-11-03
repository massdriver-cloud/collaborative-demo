.PHONY: all publish-bundles publish-artifacts clean lambda-image project

# Default project name (demoMMDD format)
PROJECT_NAME?=$(shell date +cd%m%d)

# Default target - runs all publishing tasks
all: publish-artifacts publish-bundles clean project

# Publish all bundles by running 'mass bundle publish' in each bundle subdirectory
publish-bundles:
	@echo "Publishing all bundles..."
	@for bundle in bundles/*/; do \
		if [ -d "$$bundle" ]; then \
			echo "Publishing bundle in $$bundle"; \
			cd "$$bundle" && mass bundle publish && cd - > /dev/null; \
		fi; \
	done
	@echo "All bundles published successfully!"

# Publish all artifact definitions by running 'mass definition publish' for each file
publish-artifacts:
	@echo "Publishing all artifact definitions..."
	@for artifact in artifact-definitions/*; do \
		if [ -f "$$artifact" ]; then \
			echo "Publishing artifact definition: $$artifact"; \
			mass definition publish -f "$$artifact"; \
		fi; \
	done
	@echo "All artifact definitions published successfully!"

clean:
	@echo "Cleaning up schema-*.json files..."
	@find bundles/ -name "schema-*.json" -type f -delete 2>/dev/null || true
	@echo "Clean completed!"

# Create a new Massdriver project with environment and packages
project:
	@echo "Creating project: $(PROJECT_NAME)"; \
	echo "Deleting existing project (if any)..."; \
	mass project delete $(PROJECT_NAME) -f 2>/dev/null || true; \
	echo "Creating project: $(PROJECT_NAME)"; \
	mass project create $(PROJECT_NAME) -n "🧪 Collaborative Demo $(PROJECT_NAME)"; \
	echo "Creating environment: $(PROJECT_NAME)-staging"; \
	mass environment create $(PROJECT_NAME)-staging; \
	echo "Creating packages..."; \
	mass package create $(PROJECT_NAME)-staging-apigateway --bundle aws-collab-apigateway; \
	mass package create $(PROJECT_NAME)-staging-dynamodb --bundle aws-collab-dynamodb; \
	mass package create $(PROJECT_NAME)-staging-lambda --bundle aws-collab-lambda; \
	echo "Project setup completed successfully!"

# Help target to show available commands
help:
	@echo "Available targets:"
	@echo "  all               - Publish all bundles and artifact definitions (default)"
	@echo "  publish-bundles   - Publish all bundles in the bundles/ directory"
	@echo "  publish-artifacts - Publish all artifact definitions in artifact-definitions/"
	@echo "  clean             - Remove schema-*.json build files"
	@echo "  project           - Create a new Massdriver project with environment and packages"
	@echo "                      Usage: make project [PROJECT_NAME=demoMMDD]"
	@echo "  help              - Show this help message" 
