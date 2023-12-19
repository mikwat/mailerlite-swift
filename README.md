MailerLite Swift SDK
====================

## Usage
```swift
import MailerLiteApiClient

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

## License
[The MIT License (MIT)](LICENSE)
