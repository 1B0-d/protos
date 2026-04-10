.PHONY: generate clean

# Generate Go code from proto files
generate:
	@echo "Generating Go code from proto files..."
	mkdir -p ../ap-pb/payment
	mkdir -p ../ap-pb/order
	protoc --go_out=../ap-pb/payment --go-grpc_out=../ap-pb/payment proto/payment.proto
	protoc --go_out=../ap-pb/order --go-grpc_out=../ap-pb/order proto/order.proto
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
