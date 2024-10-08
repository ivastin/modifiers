//
//  File.swift
//  
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation
import Vapor

struct Item: Content {
    let title: String
    let description: String
    let id: String
    let type: String
}

enum ItemType: String, Codable {
    case text
    case image
    case url
}


extension Item {
    static let sample = [Item(title: "First item", description: "details for first from backend", id: "1", type: ItemType.text.rawValue),
                         Item(title: "Second Item", description: "details for second from backend", id: "2", type: ItemType.text.rawValue),
                         Item(title: "Third Item", description: "details for image from backend", id: "3", type: ItemType.image.rawValue),
                         Item(title: "Image Item", description: "details for image from backend", id: "4", type: ItemType.image.rawValue),
                         Item(title: "WEB Item", description: "details for web from backend", id: "5", type: ItemType.url.rawValue),
                         Item(title: "Text6", description: "details for 6 from backend", id: "7", type: ItemType.text.rawValue),
                         Item(title: "Text7", description: "details for 7 from backend", id: "7", type: ItemType.text.rawValue),
                         Item(title: "Text8", description: "details for 8 from backend", id: "8", type: ItemType.text.rawValue),
                         Item(title: "Text9", description: "details for 9 from backend", id: "9", type: ItemType.text.rawValue),
    Item(title: "Last Item", description: "not exist", id: "10", type: ItemType.image.rawValue)]
    
    static func createDetails(itemId: String) -> ItemDetails? {
        guard let item = sample.filter({ $0.id == itemId }).first else { return nil }
        if let index = Int(itemId), index == sample.count {
            return nil
        }
        switch item.id {
        case "1":
            return ItemDetails(item: item, content: "just text for 1")
        case "2":
            return ItemDetails(item: item, content: "test again for 2")
        case "3":
            return ItemDetails(item: item, content: "https://cdn.shopify.com/s/files/1/0054/6682/files/how_to_make_beer_480x480.jpg?v=1682910325")
        case "4":
            return ItemDetails(item: item, content: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAMAAzAMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAABAYDBQcCAQj/xABIEAABAwIDBQQFBwgIBwAAAAABAAIDBBEFEiEGEzFBUQciYXEygZGhsRQjQlLB0fAzNkNiY3KSohUkJjRTgrLhFiU1s8LD4v/EABoBAQACAwEAAAAAAAAAAAAAAAACAwEEBQb/xAApEQACAgEEAQQBBAMAAAAAAAAAAQIDEQQSITEyBRNBUTMiI7HwFGFx/9oADAMBAAIRAxEAPwDuKIiAIiIAiLzI9sbS57gGgXJPJAekWimxwSvc2iDSwaGQ8/JRZK+UWG9cT5rGTOCzr5cdVX4nPksS8kHxUljW87+1MjBuEWsdEAzTj603I6m/mmRg2aLXtjf9b3r6GG+pPqKZGCeiiNkezhqOhWaGVsngeiZGDKiIsmAiIgCIiAIiIAiIgCIiAIiID4dQqJ2iY1LS1NNh8dxG9ud5va+uivZXJu1l72Y/SG3d3GntWG8IyuWTKHEWCJoJ1tqptPWNll8FR6OtIHqW1w+pcHXBGvRVb0W7S+U83dBUxkwtboeaq0FQ8j0rFTo6l+YfOE3FrLO4xgscdQD0WQObmvdaKKUg2zFSmzPKzuI4Nw2Rtl9zN4grUiWTKADYr02eVjbE35rORg2JIPBYhIY3hw5cVEbUPJ14L4ZwBrxumQbuJ4kYHA3BXtQMLkziRt7gcFPUyAREQBERAEREAREQBERAEREAK492wy/2gpGWIIphr11K7AVxHtdn3u1QYL2iha0+fFQseETrWZGho58pALbg6Lb0cpD+6tLhzbmxPFWSlpXNABJtpyXNs1G34N+NSaJ8dY2JzWvda4vqtjDOCzeukDGD6TtFCjhNm5gCRw00WWSniqqV0FQ8sde7Xs1APkqVrH9GXQvssNOxzg0Aguc3M3XiFIEzbXfoqw+Kjg+TPNVMx1OMtg65cOikwYhBUveIXB13ZspGUi9rnqeftV0dZHp8MrdH0WCGqiuQHXcOK9fKRl10F+NtFq6OpYydtMYRJI891znEAdOXHh7VimdWzvcaRzGMZYuZMSCT0CnPW11rMmQ9nk3m+aQschFjrcLXM3hcb903152KwYpiMVDRSSyOsADoBclbMLFJZKnB5wW3A2gUxfcHOeR4LZArnvZm2WrmxKrkrpnkmMCIP7rdL3t1N/cFe9zJynf6yPuWxF5RS+yQl1H3Mt/y7vd9ybqcasnJPRzRqsmCQDfgijQVJc90UrQyQa2vxHVSUAREQBERAEREAREQHwrina9CY9qWPPCSna4e8fYu2LmHbTR3jwutA1D3Qn12I+DlCzxJ1+RRMHa11REJHFsZIzOAvYcyrVh+7JcJHXBYQ3S1+hVTw+wYBc5/BWbCO8dCb3XHuj9nSg+DdQNaY2u1ItqQLi62tBQU8kW+li3jjpZw09iwwU4+T5xfM0A6nxWwocvyfW/Eled1d25fpLG3g8mipxeNtJDuzY2y2uocuGU8Ezpoe6AS0jkL+K2Mk2SXJ3SLX1NrLDPKR3dCPDX8a3WrTKbmsEU2Qqana+qildcGNwOVv0+Ngp9MXPqpHuFidVjhheTvIwRbnzBWfVsbgz6Wlz5r060qsjmS4KpT5IlR83dw9HWypW3b5JMAlqBo10rMgHTMNfWrhX5nuZE24LzYEHh1VY7Qow7Z2WOMWAfGBboHD7FfddstjUjEIcOTJPZrDjRpKipw9jhSzBgDiWi7m3Btca8ldwdogADGD452fcsXZoLbE4UDyht7yrOuvHo58uytVE+0UcJdHTl0g1ADmG48tFj2S2thxuoqMPqBusRp754y0szAcwDw8laCLrmW1rG4J2p4BisYDI607iW3BxPc1/iB9SkYL/iDbOpqkaGOUA+Idp8SFPUesjM1JNG30iwhvgeXvXqkmFRTRTN9GRjXDyIQGZERAEREAREQBERAFz3tgu6gw2IHR8rwf4dD7V0Jc+7WTcYQ39pIfc371Vc8VtllSzNIoWDYPWVceaOEDTTM63sutzh0ckUzmvaWlpsRwsVPw6kApGNhGRxN+K810bmyNn1aScjgAeI5/jovNPVt27X0dbYlE3EFS/dhjbnMLEEfjxUuB7m3aZCwDl4rXYdIIyH2uAPJTXOMry8/SVNlEE3mPBH/AEe7uc4uJvfjfij88brO0PgvLLjS+i92N8x4qdMIZ4DeDNTukjpp3uc8C4LSeBWRzgbZhYEjivP5SLUd3pmWOtfZha03LQLefRdTT7qU42Sya0lufBHpxvJJJ7aei3w6qvbYs3mHubyzD4q0sjEMDYxybc+arW1AvSO8LFceu126hyZs4xDBcuzzTZDDgOAYR7yrIq32efmnRDpm+Ksi9fDxRyZdsLnfbZTn/h6jxGPR9FVsNxxAdp8bLoirHaXSfLNhsYjy5i2nMgA6tId9ikRN9h9SKzD6eqb+mibJ7QCsOEECmfDzhmkjy9AHEt/lLVp+zWs+WbE4XJmzObDkP+U2+5bWgtHimJxc3Pjn9rAz/wBaA2SIiAIiIAiIgCIiA+Hgud9rB/rODt6mX/xXRCuc9qmuI4O3o2T4tVGp/Ey2nzR5wtvzMa9VMbXSStdwc248wvuFi0Mfkp742Oex5Ni08fPReH1EttjZ2l0amkBBHQ2W7EbdGt7xI4k8FpWDJM8AkkO4aiw6+tb6iaxtt4MwtqDwXRtuhGEXN9/3JRIxPbaSwt6l5afx+PJZ3ZSQbaHisPB62a6o78rog5ZRKaWFrettVGcBLVAWGVveP2LI53cXykHdc/632Kevu9qja3lsrrjzk9SXsVWtpP7q9WWXgVXNov7s/wAlydD5GzLotnZ1+adH/m+KsqrPZ1+alL5u+Ksy9rDxRx5+TCh4vCKjC6yA/paeRntaQpi8vF2uHUKZE5/2HzZ9ixEfShqHtPuVwAyY+/8AbUoP8Dv/ALVF7FO5SY/T/wCDiLm/FXuo7uOUjvrQSs97T9iA2KIiAIiIAiIgCIiA+Fc47T3f85wtv7N/xC6OVzPtPP8AaHCh0hd/qWvqvxMuo/IjLQ6Rt8l7qnukDYwSMzhw818oxeNvklQOY0I5rw2p8zuR6McTmmve4jMLnS9vUt1G8Bl25Tp1WlqAGTgttlcMwU+J92hvC3NdjT11X1R3RyalmU+CYJG/SF16mjjHoOv3QdVihe29nLI0AcLDS2g5LajG/wB7jw/gpeMGKQnJkAacx58VJAysA8FHePnmfvBSDYBcb1SX7uF0W1rgxycCq7tGbUkh8FYnnQqt7Um1DIfBR0PMyyXRaezV2bZOmP67/irSql2Xm+yFN++/4q2r29fijjy8mF8PPxX1fOamROadkZy4xtXFyGIOP8xV5xDTF8MPV8jf5HH7FROyQ3x7a0jh8ud/qKveI/8AVMK8ZZP+25AbNERAEREAREQBCiID4uYdphzbT4cPq0+v8RXTyuW7fu3m1rB9SFo+JWrq3ill1HmidRW3bellJdGx/ELX0ktoxZZXVuU814jVwk5cHbh0eq9oLomtHK3qWSmdpZRqqYTRwubx1OqmUjQWh2i6Xpy/ZSka93Znbos8Vjwba4tx4rzuza9uPJfY3RnMHXaWtuNF1OKpJzl/w1+ZLg8y2E7Bls6+izPJ0CjON6pt3X56rNI4XXnfVZN2vJs1rhHlztCq/tMM1DIPBbuR4sVo8dOamePBWenrlGbCzdl+mycLekj/AIq2qndl777PvZ9SdwVxXtq/BHGn5MLHNK2Jj5HmzWtLnE8gEnljhYXyuDWjqtLVS1GL3p6cZYDo955hTIlP7Fs0x2grnRuaKiuLm5mkGxuftV9rhfEsO/Ve8/yEfasmHUMOH0wggbYcXG3pHmVjB3+Mkt1bTRWcej3EWHnYH+IIDYoiIAiIgCIiAIiID4VyPayXfbXVjuTCGewLrjjYX6LgWJ4gX43VzONw+ZxvfxWprPx4L9P5lopnHdhHsJF1qKPEA9oIKliuaTqvJ3xaZ2K2bEt3eSMm+UfHVbCF2WHM0W1sVqoZd+8P5HRbvD3xPa5oIcR3XDoV1NJSvYUfl/ya1ssTJkM7XQBkhsG3JPgvpFMXMc51w/gRfU+K8wwRxSBkZADvSadbrO+lZI0McwFlwWhvVbNdFipUJYbX2UOUXLKIFWQ1wkjByjW/UL494I4pWueY5GbjdhrePIrWtr2yQMffiLkLl+o0qdm5I2aZcEmWS11qMSeHscLrLNVAg2Wmr6xoJbdQ0kMPBmwsfZ3jlDh8suF1k27mqH54bg2cbatHjzV5qMSGYxUrHSSeS5Dso5jtrsL37WuZIXsFx6JtoR48vWu0Q08VO3LEwNA6L1lL/Qjk2eTNfHh81U4SV8l9dIxyWyZGyINYxoa3oF4nqo4SGkF0h4RtF3H8dVgdSy1p/rpyw/4DTo7948/Lh5q0geH1clW4x4eO4NHVB9Efu9T7lJoqOOjpxDFci5Jc43c4niSeqzsYGgBoDWgWDRwC9IAiIgCIiAIiIAiIgIeL1DaTDKqodwjic73LhlPRRVtOZYaSaSQ6kh4ABPLkb6HS3rXWe0aubh+x9fM9jpGuaGFreJzEBc0wWkjxGhEsAngik4CXXnfz4jiqpxUuGTi2uhS4U9rWNbLCx7uEckzcwPtUt2CV7HOJY3KPqvBVopKKGppZ6eqoaeT5QAHSMs0h3JyyYlstWylsuFzupnZQHMD7AnhmHT2Lm6j0/PKNuvVfDNDRwvp2tZK0h3QrfUZDWgHmtdFhGPUzJnYtu5YmW3cjLXGpvf3LYUzQ9jOoUqapQglgWTUnk2EkO/hdEHuZmbbOzRzfIr2ZJd00QOdvGm13a5h1XmNsgOjlJEd+Y1W1t+inJEqWOfAd4Rntc2CrX9B1rQSW2bckEcLEq0yQFjH5cxBFibKIKPHJYwIWtii4NL3C5Cov07sxgshZtRXpMPfEwulsxoGpc6ygPwiCef0KyoOXMBTNDrj1cD5q7PwRpNPJiDpZ3xXL2CSzJAeRHMBULa2qi2bntRxiI1DnEWc4uaOYva1tQs1aKMOWRne2sEeWtpxiOGSYdRTRTUVW0thkPzkx+rYeIXZGGrq2Nc4GkY4Xymxl9fIe9cE2e2iidtbhVRJnlmdVtD3vaGsbmNibcSdeK/RAst9LBrMxQU0UAO7BBPpOJu53mTqVlsF9RSMBERAEREAREQBERAEKIgKx2g00NZgQgqKs0jHSi02UlrXfRzW5XXN8AxGrpaqppX0Utc2mALpKLv5GnTMANSNOQXWNqZaaPB5WVdOKhktoxEfpErmFNQPo5XPijqIQTlEtLVHeNHjbiqbcrlFkDaUW2WCMd89O6NzTqxzL/DgrDSbfbMvbY4pG23DOCLe0LmVVsfDLK+opqmN0z3lxE+ZjnEm5JJvrdRXYTiNK858ObIzhdhDgqf8AIkuDYVMZHZXbTbO1sD4hi9CQ4a3naPiVp6aSPeERSsmbfR8bg4e5cxmqC1tp8N0HWP8A2W52TxF8c+SGkMULnXf3rAeIunvZYdO1dnRong+KzZw02PtWshkDwHCTlyWwa4Ed4ByuTKGfZngtzclLm2kwaGM58Qp7MAvZ17exQJu/CcnduLWPJc/xKlnhzx1NMZAeBa7T2o5YMqKfZdqjbTZ+SURMxGO501BAv6wqltRS4btRPBJG+ofuC9rGxOYN6Tbhck/R5BaSLAKnE3iJ0VPTwX75Lg51uqsdDs3R0lO5jYoZpSe7KI3Ofx0sScrfYVhTz2HFIp2z+AUs9cKmeriw6ljku1rnl8ziDwa0c1+h4y4sBcLGwuFzbZ7BabC8VbVV9O0sDgIyZAcrr8SB7V0sc1bErkfURFIiEREAREQBERAEREAREQGl2tphU4XbmyRrgei0uHUrYo2yab0XGaytOKR7yhlb4XVepwSDE2xNifBYfJlHl7WuOXcxu/WI1Xn+iYpReWJjR4N/3X2QsjmLN83O36IBUplY3IC4205qqVdb7RNSn8ECTZigqLb4BwHI3UCo2MooWPlp53MLfo5yrC2tivYuHC/Ba6pqzUv0PdB0HVY9uCXBnfP5IdLQFkYyyu9xWzhgeP059gWKHofWpTXZTYanwUkjGTy6nz6Oe7X1L4cDpbZ5YhITydcrIXX1PJTnzDd6HpyKzhfJjL+CBFRQ0/5KmhaPBuqjYjVmnaWsjFyMtm8B4qfNJbW4Atqei1VXCKmN87Zm5BxKKMfgNs1EbJq+thikdo97QB01XTAqRgMAGLQyPe3IzW/DVXcWGimiB9REWQEREAREQBERAf/Z")
        case "5":
            return ItemDetails(item: item, content: "url5")
        case "6":
            return ItemDetails(item: item, content: "text6")
        case "7":
            return ItemDetails(item: item, content: "text7")
        case "8":
            return ItemDetails(item: item, content: "text8")
        case "9":
            return ItemDetails(item: item, content: "text9")
        default:
            return nil
        }
    }
}

struct ItemDetails: Content {
    let item: Item
    let content: String
    let loadingTime: Int = 0
}
