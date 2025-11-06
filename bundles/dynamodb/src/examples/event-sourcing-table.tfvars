# Event Sourcing Table Configuration
# 
# Use case: Event store for event-driven architecture and event replay
# - Compound primary key (aggregate_id + event_sequence) for event ordering
# - Streams enabled for event processing and downstream consumers
# - PITR enabled for event replay and recovery scenarios
# - On-demand billing for variable event throughput

budget = {
  limit_amount = "5"
  email_addresses = ["test@test.com"]
}

capacity = {
  billing_mode = "PAY_PER_REQUEST"  # On-demand for variable event volumes
}

global_secondary_indexes = [
  {
    attributes = {
      type               = "compound"
      partition_key      = "event_type"
      partition_key_type = "S"
      sort_key           = "timestamp"
      sort_key_type      = "N"
    }
    name            = "event-type-index"
    projection_type = "ALL"  # Full projection for event processing
    read_capacity   = 5
    write_capacity  = 5
  },
  {
    attributes = {
      type               = "compound"
      partition_key      = "aggregate_type"
      partition_key_type = "S"
      sort_key           = "event_sequence"
      sort_key_type      = "N"
    }
    name            = "aggregate-type-index"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 5
  }
]

pitr = {
  enabled = true  # Critical for event replay and recovery scenarios
}

primary_index = {
  type               = "compound"
  partition_key      = "aggregate_id"
  partition_key_type = "S"
  sort_key           = "event_sequence"
  sort_key_type      = "N"
}

region = "us-east-1"

stream = {
  enabled   = true
  view_type = "NEW_AND_OLD_IMAGES"  # Full stream for event processing pipelines
}

ttl = {
  enabled = false  # Events retained indefinitely for event sourcing patterns
}

