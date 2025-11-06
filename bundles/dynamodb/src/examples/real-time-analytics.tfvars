# Real-time Analytics Dashboard Configuration
# 
# Use case: Analytics table with multiple query patterns for dashboard visualizations
# - Compound primary key (metric_type + timestamp) for time-series data
# - Multiple GSIs for different query patterns (by user, by category, by region)
# - Provisioned capacity for predictable analytics workload
# - PITR enabled for data recovery and analytics replay

budget = {
  limit_amount = "5"
  email_addresses = ["test@test.com"]
} 

capacity = {
  billing_mode   = "PROVISIONED"
  read_capacity  = 50   # High read capacity for dashboard queries
  write_capacity = 10   # Moderate write capacity for metric ingestion
}

global_secondary_indexes = [
  {
    attributes = {
      type               = "compound"
      partition_key      = "user_id"
      partition_key_type = "S"
      sort_key           = "timestamp"
      sort_key_type      = "N"
    }
    name            = "user-id-timestamp-index"
    projection_type = "ALL"  # Full projection for analytics queries
    read_capacity   = 25
    write_capacity  = 10
  },
  {
    attributes = {
      type               = "compound"
      partition_key      = "category"
      partition_key_type = "S"
      sort_key           = "timestamp"
      sort_key_type      = "N"
    }
    name            = "category-timestamp-index"
    projection_type = "ALL"
    read_capacity   = 25
    write_capacity  = 10
  },
  {
    attributes = {
      type               = "compound"
      partition_key      = "region"
      partition_key_type = "S"
      sort_key           = "timestamp"
      sort_key_type      = "N"
    }
    name            = "region-timestamp-index"
    projection_type = "ALL"
    read_capacity   = 25
    write_capacity  = 10
  }
]

pitr = {
  enabled = true  # Enable for analytics data recovery and historical analysis
}

primary_index = {
  type               = "compound"
  partition_key      = "metric_type"
  partition_key_type = "S"
  sort_key           = "timestamp"
  sort_key_type      = "N"
}

region = "us-east-1"

stream = {
  enabled   = true
  view_type = "NEW_AND_OLD_IMAGES"  # Full stream view for analytics processing
}

ttl = {
  enabled = false  # Analytics data retained indefinitely
}

