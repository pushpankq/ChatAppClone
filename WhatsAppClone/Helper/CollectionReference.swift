//
//  CollectionReference.swift
//  WhatsAppClone
//
//  Created by Puspank Kumar on 18/01/19.
//  Copyright © 2019 Puspank Kumar. All rights reserved.
//

import Foundation
import Foundation
import FirebaseFirestore


enum FCollectionReference: String {
    case User
    case Typing
    case Recent
    case Message
    case Group
    case Call
}


func reference(_ collectionReference: FCollectionReference) -> CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}
