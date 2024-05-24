# Updated Proposal: Implementation of Essential Tuple Normalization Form (ETNF) for relational databases (rdbms, sql)

## Context

V-Sekai is committed to enhancing data integrity, optimizing database performance, and standardizing data storage practices. To achieve these goals, we propose the adoption of the Essential Tuple Normalization Form (ETNF) across our database systems.

## Problem Statement

Currently, V-Sekai's database systems lack a standardized approach to normalization. This leads to data redundancy, inconsistency, and inefficiencies in data management, which can hamper system performance and scalability.

## Proposal Overview: ETNF Implementation

We propose implementing ETNF, a normalization form that strikes an optimal balance between eliminating redundancy and maintaining manageable complexity in database schemas. Positioned between the fourth normal form (4NF) and the fifth normal form (5NF), ETNF provides a sophisticated yet practical approach to database normalization.

### Description of ETNF

A relation schema R is in Essential Tuple Normal Form (ETNF) if every tuple in every instance of R is essential. This means that no tuple in the database can be generated from other tuples, thus eliminating redundancy.

In mathematical terms, a relation R is in ETNF if and only if it is in Boyce-Codd Normal Form (BCNF) and some component of every explicit join dependency (JD) of R is a superkey. Specifically, for every nontrivial join dependency {R1, R2, ..., Rn} that holds over R, the intersection of each pair of Ri and Rj is a superkey for at least one of Ri or Rj.

This concept is further illustrated by the theorem stating that if R is a relation schema specified only by functional dependencies (FDs) and join dependencies (JDs), then R is in ETNF if and only if it is in BCNF and some component of every explicit JD of R is a superkey.

Therefore, ETNF is an effective normalization form that reduces data redundancy while maintaining manageable complexity in database schemas. It provides a balance between the elimination of unnecessary redundancy and the avoidance of extensive decomposition associated with higher normal forms like 5NF.

#### Example 1: Non-Normalized Data

Consider a V-Sekai database table storing information about parts, suppliers, and respective shipments. The table is not normalized and contains redundant data.

| SupplierID | SupplierName | PartID | PartName | ShipmentQuantity |
| ---------- | ------------ | ------ | -------- | ---------------- |
| S1         | Alice        | P1     | Part1    | 100              |
| S1         | Alice        | P2     | Part2    | 200              |
| S2         | Bob          | P1     | Part1    | 150              |
| S2         | Bob          | P3     | Part3    | 300              |
| S3         | Charlie      | P2     | Part2    | 250              |

In this table, `SupplierName` and `PartName` are repeated for each `SupplierID` and `PartID`, respectively. This redundancy can lead to inconsistencies and anomalies.

#### Example 2: ETNF Normalized Data

To normalize the above table into ETNF, we would decompose it into three separate tables: `Supplier`, `Part`, and `Shipment`.

##### Supplier Table

| SupplierID | SupplierName |
| ---------- | ------------ |
| S1         | Alice        |
| S2         | Bob          |
| S3         | Charlie      |

##### Part Table

| PartID | PartName |
| ------ | -------- |
| P1     | Part1    |
| P2     | Part2    |
| P3     | Part3    |

##### Shipment Table

| SupplierID | PartID | ShipmentQuantity |
| ---------- | ------ | ---------------- |
| S1         | P1     | 100              |
| S1         | P2     | 200              |
| S2         | P1     | 150              |
| S2         | P3     | 300              |
| S3         | P2     | 250              |

In these normalized tables, each tuple is essential and there is no redundancy. The `SupplierName` is not repeated for each shipment from the same supplier, and similarly, the `PartName` is not repeated for each shipment of the same part. This design adheres to the principles of ETNF, enhancing data integrity and consistency.

### Key Characteristics of ETNF:

- **Redundancy Reduction**: ETNF effectively reduces data redundancy by ensuring that all data stored in the database is essential and non-repetitive.
- **Data Integrity and Consistency**: By minimizing redundancy, ETNF enhances the integrity and consistency of the database, making data more reliable and accurate.
- **Balanced Complexity**: ETNF offers a middle ground between 4NF and 5NF, reducing redundancy without the complexity of decomposing relations into smaller, more numerous relations as often required by 5NF.

### Operational Implications for Database Practitioners

1. **Dependency Analysis**: The first step involves a detailed analysis of all functional and join dependencies across the database to identify redundancy and determine the scope for normalization to ETNF.
2. **Schema Evaluation and Restructuring**: Evaluate existing database schemas against ETNF criteria, identifying areas where restructuring is required to eliminate redundancy and enhance efficiency.
3. **Practical Application and Migration**: Implement the ETNF principles through schema redesign and careful data migration, ensuring that the transition does not impact data integrity or system availability.

## Benefits for V-Sekai

- **Enhanced Data Integrity**: Implementation of ETNF will significantly improve the integrity and reliability of V-Sekai's data.
- **Optimized Performance**: By reducing redundancy, ETNF will streamline data storage and retrieval processes, enhancing overall system performance.
- **Strategic Data Management**: Adopting ETNF aligns with strategic initiatives for scalable, efficient, and consistent data management practices.

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [A normal form for preventing redundant tuples in relational databases](https://dl.acm.org/doi/10.1145/2274576.2274589)

AI assistant Aria assisted with this article.
