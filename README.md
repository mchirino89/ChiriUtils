# ChiriUtils
This helper [library](https://cocoapods.org/pods/ChiriUtils) includes some of the most basic and used commonly written features in everyday Swift development such as:

- `JSONDecodable`: implement this protocol in order to transform JSON's data _Decobale_ compliant models and worry only about passing in its Type and decoding strategy (only if you wish to for the later one, otherwise a `.default` will be implemented for you)

- `JSONHelper`: read locally stored files within your project or inside the app's bundle with this _factory_ class.

- And more: deque your `UITableView`/`UICollectionView` in a typesafe way. Avoid the _guard-let-else_ dance altogether or even worse: the infamaus force casting **!**

Feel free to submit your pull requests and I'll happily check them. Thanks!
