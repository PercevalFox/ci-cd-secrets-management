#!/bin/bash
vault kv put kv/my-secret-path secret-key=$(openssl rand -base64 32)
