# ADR 0001: Monorepo with independently deployable packages

**Decision:** One repository; shared contracts in `packages/contracts`; each
deployable in its own package with its own Dockerfile and path-filtered CI.

**Why:** Contract changes are atomic across producers and consumers, while each
unit still builds, scales and releases on its own.
