//  This file was automatically generated and should not be edited.

import Apollo

public final class AllReposQuery: GraphQLQuery {
  public static let operationDefinition =
    "query AllRepos {" +
    "  viewer {" +
    "    login" +
    "    repositories(last: 5) {" +
    "      edges {" +
    "        node {" +
    "          ...RepoDetails" +
    "        }" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(RepoDetails.fragmentDefinition)

  public struct Data: GraphQLMapDecodable {
    public let viewer: Viewer

    public init(map: GraphQLMap) throws {
      viewer = try map.value(forKey: "viewer")
    }

    public struct Viewer: GraphQLMapDecodable {
      public let __typename = "User"
      public let login: String
      public let repositories: Repository

      public init(map: GraphQLMap) throws {
        login = try map.value(forKey: "login")
        repositories = try map.value(forKey: "repositories")
      }

      public struct Repository: GraphQLMapDecodable {
        public let __typename = "RepositoryConnection"
        public let edges: [Edge?]?

        public init(map: GraphQLMap) throws {
          edges = try map.optionalList(forKey: "edges")
        }

        public struct Edge: GraphQLMapDecodable {
          public let __typename = "RepositoryEdge"
          public let node: Node?

          public init(map: GraphQLMap) throws {
            node = try map.optionalValue(forKey: "node")
          }

          public struct Node: GraphQLMapDecodable {
            public let __typename = "Repository"

            public let fragments: Fragments

            public init(map: GraphQLMap) throws {
              let repoDetails = try RepoDetails(map: map)
              fragments = Fragments(repoDetails: repoDetails)
            }

            public struct Fragments {
              public let repoDetails: RepoDetails
            }
          }
        }
      }
    }
  }
}

public struct RepoDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment RepoDetails on Repository {" +
    "  name" +
    "}"

  public static let possibleTypes = ["Repository"]

  public let __typename = "Repository"
  public let name: String

  public init(map: GraphQLMap) throws {
    name = try map.value(forKey: "name")
  }
}