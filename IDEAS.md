# FFExerciseTemplate

This project contains all the following exercises with a solution proposal that can be used as guidance. Bear in mind that we have a variety of ways for solving the same problem.

## Architecture

1 - Decouple hash generation responsability from `NetworkLayer` since this is bespoke to each API Networking specification.

2 - Add a *Cache Mechanism* to the `ImageStore` artefact.

3 - Populate the provided `UITableView` using the same datasource but with a different API. You must conform with a `ServiceLayerProtocol` and use the provided `Codable` models.

## UI

## Networking

1 - Fetch all related categories from a given `Character` using the available `Codable` models. You must use the correspondent ServiceLayer.

## Unit Testing

1 - Create `FFImageStoreTests` for testing both Network and internal `ImageStore` caching mechanism.

