# AWS DynamoDB Table Bundle

A Massdriver bundle for provisioning AWS DynamoDB tables with flexible configuration options for various use cases.

## Overview

This bundle creates a fully managed DynamoDB table with support for:
- **Billing modes**: Provisioned capacity or on-demand (pay-per-request)
- **Primary keys**: Simple (partition key only) or compound (partition + sort key)
- **Global Secondary Indexes**: Multiple indexes for efficient query patterns
- **DynamoDB Streams**: Real-time change data capture
- **Point-in-time Recovery**: Automated backups for data protection
- **TTL**: Automatic item expiration

## Features

- Flexible capacity management (provisioned or on-demand)
- Support for simple and compound primary keys
- Configurable global secondary indexes
- Optional DynamoDB Streams with configurable view types
- Point-in-time recovery for data protection
- Time-to-live (TTL) support for automatic data expiration
- IAM role-based authentication

## Configuration

The bundle accepts configuration through the `massdriver.yaml` schema. Key parameters include:

- **Region**: AWS region for table deployment
- **Capacity**: Billing mode and throughput settings
- **Primary Index**: Table key schema (simple or compound)
- **Global Secondary Indexes**: Additional query patterns
- **Stream**: DynamoDB Streams configuration
- **TTL**: Time-to-live settings
- **PITR**: Point-in-time recovery settings

## Examples

Example configurations are available in `src/examples/`:

- `audit-log-table.tfvars` - Audit trail with compound keys and streams
- `event-sourcing-table.tfvars` - Event sourcing pattern
- `real-time-analytics.tfvars` - Analytics workload configuration
- `user-session-store.tfvars` - Session storage with TTL

## Resources

- [AWS DynamoDB Documentation](https://docs.aws.amazon.com/dynamodb/)
- [Massdriver Documentation](https://docs.massdriver.cloud/)

