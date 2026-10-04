# infra

- `podman/` – local full-stack via `podman compose` (`compose.yaml`)
- `k8s/<unit>/` – per-deployable manifests (one Deployment/Service per unit)
- `terraform/` – cloud resources: Postgres, Redis/queue, object storage, registry
