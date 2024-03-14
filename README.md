MailerLite Swift SDK
====================
A basic Swift SDK for the [MailerLite API](https://developers.mailerlite.com/docs/).

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmikwat%2Fmailerlite-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/mikwat/mailerlite-swift)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmikwat%2Fmailerlite-swift%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/mikwat/mailerlite-swift)

## Usage

### Get a list of subscribers
```swift
import MailerLiteAPIClient

let mailerLite = MailerLiteAPIClient(apiKey: "your-api-key")

do {
    let response = mailerLite.send(ListSubscribers())
    // TODO: handle response
    let data = response.data {
        print("Found \(data.count) subscribers")
    }
} catch {
    // TODO: handle error
}
```

### Upsert a subscriber
```swift
import MailerLiteAPIClient

let mailerLite = MailerLiteAPIClient(apiKey: "your-api-key")

do {
    let response = mailerLite.send(UpsertSubscriber(email: "dummy@example.com", fields: Subscriber.Fields(lastName: "Testerson")))
    // TODO: handle response
    let data = response.data {
        print("Subscriber \(data.email) upserted")
    }
} catch {
    // TODO: handle error
    switch result {
}
```

### Update a subscriber
```swift
import MailerLiteAPIClient

let mailerLite = MailerLiteAPIClient(apiKey: "your-api-key")

do {
    let response = mailerLite.send(UpdateSubscriber(
        id: "31897397363737859",
        fields: Subscriber.Fields(
            lastName: nil,
            name: "Dummy"
        ),
        groups: [
            "4243829086487936",
            "14133878422767533",
            "31985378335392975"
        ]
    )))
    // TODO: handle response
    let data = response.data {
        print("Subscriber \(data.id) updated")
    }
} catch {
    // TODO: handle error
}
```

## Contributing
Please help improve this SDK! Contributions welcome.

## License
[The MIT License (MIT)](LICENSE)
