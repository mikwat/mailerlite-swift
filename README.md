MailerLite Swift SDK
====================
A basic Swift SDK for the [MailerLite API](https://developers.mailerlite.com/docs/).

## Usage

### Get a list of subscribers
```swift
import MailerLiteAPIClient

let mailerLite = MailerLiteAPIClient(apiKey: "your-api-key")

mailerLite.send(ListSubscribers()) { result in
    switch result {
    case .success(let response):
        // TODO: handle response
        let data = response.data {
            print("Found \(data.count) subscribers")
        }
    case .failure(let error):
        // TODO: handle error
    }
}
```

### Upsert a subscriber
```swift
import MailerLiteAPIClient

let mailerLite = MailerLiteAPIClient(apiKey: "your-api-key")

mailerLite.send(UpsertSubscriber(email: "dummy@example.com", fields: Subscriber.Fields(lastName: "Testerson"))) { result in
    switch result {
    case .success(let response):
        // TODO: handle response
        let data = response.data {
            print("Subscriber \(data.email) upserted")
        }
    case .failure(let error):
        // TODO: handle error
    }
}
```

### Update a subscriber
```swift
import MailerLiteAPIClient

let mailerLite = MailerLiteAPIClient(apiKey: "your-api-key")

mailerLite.send(UpdateSubscriber(
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
))) { result in
    switch result {
    case .success(let response):
        // TODO: handle response
        let data = response.data {
            print("Subscriber \(data.id) updated")
        }
    case .failure(let error):
        // TODO: handle error
    }
}
```

## Contributing
Please help improve this SDK! Contributions welcome.

## License
[The MIT License (MIT)](LICENSE)
