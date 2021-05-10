# Database

The Clothes Shop Database

[Tables](#tables)

[Views](#views)

[Indexes](#indexes)

[User Interface](#user-interface)

[Phase 0 - Project Proposal](#phase-0---project-proposal)

[Phase 1 - Enhanced Entity Relational Diagram](#phase-1---enhanced-entity-relational-diagram)

[Phase 2 - Relational Model Diagram](#phase-2---relational-model-diagram)

## Tables

- Clients

- Clothes

- ClothesReceipt

- Dresses   (child of Clothes)

- Employees

- Hats      (child of Clothes)

- Managers

- Owner

- Pants     (child of Clothes)

- Receipt

- Shoes     (child of Clothes)

- Suppliers

- Supply

- Tops      (child of Clothes)

- Worker

## Views

- AllClientsReceipt:
A view of all the receipts to get which clothing item was bought by which client.

- AllClothes:
A view of all the clothes (tops, pants, shoes, hats, dresses).

- SuppliersClothes:
A view of all the clothing items and their corresponding supplier.

## Indexes

Added the following indexes, because we will be searching on them when joining tables and selecting

- ReceiptIdIndex

- SuppliersSupplierIdIndex

- ClothesIdIndex

- TopsClothesIdIndex

- PantsClothesIdIndex

- HatsClothesIdIndex

- ShoesClothesIdIndex

- DressesClothesIdIndex

- ClothesReceiptClothesIdIndex

- ClothesReceiptReceiptIDIndex

- SupplyClothesIdIndex

- SupplySupplierIdIndex


## User Interface

![Model part 1](/images/model1.png)

![Model part 2](/images/model2.png)

## Phase 0 - Project Proposal

![proposal part 1](/images/proposal1.png)

![proposal part 2](/images/proposal2.png)

## Phase 1 - Enhanced Entity Relational Diagram

![EERD](/images/EERD.png)

## Phase 2 - Relational Model Diagram

![Relational-Model-Diagram](/images/relational-model.png)
