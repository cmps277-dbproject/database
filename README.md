# Database

The Clothes Shop Database

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

## Phase 0 - Project Proposal

[embed]/images/Project-Proposal.pdf[/embed]

## Phase 1 - Enhanced Entity Relational Diagram

![EERD](/images/EERD.png)

## Phase 2 - Relational Model Diagram

![Relational-Model-Diagram](/images/relational-model.png)
