.PHONY: generate clean

# Generate Go code from proto files
generate:
	@echo "Generating Go code from proto files..."
	mkdir -p ../ap-pb/payment
	mkdir -p ../ap-pb/order
	protoc -I proto -I protoc-temp/include --go_out=../ap-pb/payment --go_opt=paths=source_relative --go-grpc_out=../ap-pb/payment --go-grpc_opt=paths=source_relative payment.proto
	protoc -I proto -I protoc-temp/include --go_out=../ap-pb/order --go_opt=paths=source_relative --go-grpc_out=../ap-pb/order --go-grpc_opt=paths=source_relative order.proto
	@echo "Code generation complete!"

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	rm -f ../ap-pb/payment/*.pb.go
	rm -f ../ap-pb/order/*.pb.go
	@echo "Clean complete!"

# Help command
help:
	@echo "Available commands:"
	@echo "  make generate - Generate Go code from proto files"
	@echo "  make clean    - Remove generated files"
