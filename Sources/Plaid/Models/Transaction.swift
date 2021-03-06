import Vapor

/// See [Transactions](https://plaid.com/docs/api/#transactions)
public struct PlaidTransaction: Content {
    public let accountID: String
    public let amount: Float
    // TODO: Make currency code enum with iso, unofficial cases?
    public let isoCurrencyCode: String?
    public let unofficialCurrencyCode: String?
    public let category: [String]
    public let categoryID: String
    public let date: Date
    public let location: Location
    public let name: String
    public let paymentMeta: Payment
    public let pending: Bool // TODO: Rename isPending?
    public let pendingTransactionID: String?
    public let accountOwner: String?
    public let transactionID: String
    public let transactionType: TransactionType

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case amount
        case isoCurrencyCode = "iso_currency_code"
        case unofficialCurrencyCode = "unofficial_currency_code"
        case category
        case categoryID = "category_id"
        case date
        case location
        case name
        case paymentMeta = "payment_meta"
        case pending
        case pendingTransactionID = "pending_transaction_id"
        case accountOwner = "account_owner"
        case transactionID = "transaction_id"
        case transactionType = "transaction_type"
    }

    public struct Location: Codable {
        public let address: String?
        public let city: String?
        public let state: String?
        public let zip: String?
        public let lat: Float?
        public let lon: Float?
    }

    public struct Payment: Codable {
        public let ppdID: String?
        public let reason: String?
        public let paymentProcessor: String?
        public let referenceNumber: String?
        public let byOrderOf: String?
        public let payee: String?
//        public let payeeName: String?
        public let payer: String?
        public let paymentMethod: String?

        enum CodingKeys: String, CodingKey {
            case ppdID
            case reason
            case paymentProcessor = "payment_processor"
            case referenceNumber = "reference_number"
            case byOrderOf = "by_order_of"
            case payee
//            case payeeName
            case payer
            case paymentMethod = "payment_method"
        }
//        "ppd_id" : null,
//        "reason" : null,
//        "payment_processor" : null,
//        "reference_number" : null,
//        "by_order_of" : null,
//        "payee" : null,
//        "payer" : null,
//        "payment_method" : null
    }

    /// See [Transactions](https://plaid.com/docs/api/#transactions)
    public enum TransactionType: String, Codable {
        case digital
        case place
        case special
        case unresolved
    }
}
