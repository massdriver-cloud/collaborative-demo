# User Session Store Configuration
# 
# Use case: Store user session data with automatic expiration via TTL
# - Simple partition key (session_id)
# - On-demand billing for variable traffic patterns
# - TTL enabled for automatic session cleanup
# - No streams or GSIs needed for simple key-value lookups

budget = {
  limit_amount = "5"
  email_addresses = ["test@test.com"]
}

capacity = {
  billing_mode = "PAY_PER_REQUEST"  # On-demand for variable session traffic
}

global_secondary_indexes = []  # No GSIs needed for session lookups

pitr = {
  enabled = false  # Sessions are ephemeral, no need for point-in-time recovery
}

primary_index = {
  type               = "simple"
  partition_key      = "session_id"
  partition_key_type = "S"  # String type for session IDs
}

region = "us-east-1"

stream = {
  enabled = false  # No real-time processing needed for sessions
}

ttl = {
  enabled = true  # Enable TTL for automatic session expiration
}

