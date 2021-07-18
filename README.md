# Trunk

A simple Swift Mastodon SDK.

# Usage
```swift
import Trunk

// init trunk instance.
let trunk = Trunk(instanceURL: "https://mastodon.online/", accessToken: "<accessToken>")

// Fire API.
trunk.run(request: TimelinesEndpoint.publicTimeline()) { result, headers in
    switch result {
    case .success(let model):
        print(model)
    case .failure(let error):
        print(error)
    }
}
```
# Supported API List

- [x] apps(Authorizing user needs the Webview.)
- [x] oauth
- [x] accounts(Doesn't support for registering yet.)
- [x] bookmarks
- [x] favourites
- [x] mutes
- [x] blocks
- [x] domain_blocks
- [x] filters
- [x] reports
- [x] follow_requests
- [x] endorsements
- [x] featured_tags
- [x] preferences
- [x] suggestions
- [x] statuses
- [x] media
- [x] polls
- [x] scheduled_statuses
- [x] timelines
- [x] conversations
- [x] lists
- [x] markers
- [ ] streaming
- [x] notifications
- [ ] push
- [x] search
- [x] instance
- [x] trends
- [x] directory
- [x] custom_emojis
- [ ] admin
- [x] announcements
- [ ] proofs
- [ ] oembed
