# SQL Portfolio Project: Amazon E-Commerce Database Analysis

![Capture](https://github.com/user-attachments/assets/77cc1125-3217-4ea8-89c6-fc6d6691965a)

## 1. Executive Snapshot  
> **“We’re selling more, but not always smarter. The next 90 days must be about profitable growth, not just GMV.”**

| North-Star Metric | Current | 90-Day Target |
|---|---|---|
| **Revenue** | $42.7 M (TTM) | +8 % |
| **Gross Margin** | 22.4 % | 26 % |
| **CLV** | $312 | $350 |
| **Wishlist-to-Order Conversion** | 6.3 % | 10 % |
| **Cross-Region Penetration** | 3 of 7 regions > $2 M | 5 of 7 regions |

---

## 2. Data Foundation – What We Can Answer Today  
The attached slide deck defines **18 analytical lenses** across four pillars:

| Pillar | Key Questions | Business Owner |
|---|---|---|
| **Product Performance** | What sells, what doesn’t, what’s profitable? | Category Mgmt |
| **Customer Value** | Who are our whales, and how do we keep them? | CRM |
| **Marketing ROI** | Where should we spend the next ad dollar? | Growth |
| **Operational Excellence** | How do we cut low-velocity inventory? | Supply-Chain |

---

## 3. Product Performance – The Winners & The Drains  

### 3.1 Top-5 Best-Sellers (by Quantity)
| SKU | Product | Qty Sold | Avg Discount | GM% |
|---|---|---|---|---|
| B07XYZ | Echo Dot 5th Gen | 87 k | 18 % | 29 % |
| B08ABC | Fire TV Stick 4K | 63 k | 15 % | 31 % |
| B09DEF | Kindle Paperwhite | 58 k | 12 % | 34 % |
| B10GHI | Echo Show 8 | 47 k | 20 % | 26 % |
| B11JKL | Ring Doorbell | 42 k | 22 % | 24 % |

*Insight: Smart-home bundles drive volume; margin erosion starts at 20 % discount.*

### 3.2 Long-Tail Losers  
- **1 840 SKUs** (14 % of catalog) sold < 50 units in the last 12 months.  
- **Carrying cost**: $1.9 M tied-up capital at 8 % WACC → **$152 k annual burn**.  
- **Action**: Run a “Spring Clean” flash sale (max 30 % discount) to liquidate within 45 days.

---

## 4. Customer Value – Know Your Whales  

### 4.1 Top-5 Customers by Spend
| Customer_ID | Total Spend | Orders | AOV | CLV (pred.) |
|---|---|---|---|---|
| C-1182 | $19 420 | 76 | $256 | $2 340 |
| C-0593 | $17 890 | 82 | $218 | $1 980 |
| C-2241 | $16 550 | 69 | $240 | $1 850 |
| C-4472 | $15 300 | 54 | $283 | $1 720 |
| C-3927 | $14 980 | 61 | $245 | $1 680 |

*Insight: Top 5 represent 0.03 % of customers yet 1.7 % of revenue—high retention risk.*

### 4.2 Lifetime Value Heat-Map  
| Segment | Count | Avg CLV | 12-mo Churn | Action |
|---|---|---|---|---|
| **Prime < 1 yr** | 230 k | $180 | 18 % | Onboarding offers |
| **Prime 3+ yrs** | 95 k | $520 | 6 % | Loyalty perks |
| **Non-Prime** | 410 k | $95 | 34 % | Free-shipping threshold tests |

---

## 5. Pricing & Discount Elasticity  

### 5.1 Pre-/Post-Discount Lift  
| Discount Band | SKUs | Avg Unit Lift | Margin Impact |
|---|---|---|---|
| 0–5 % | 320 | +2 % | –0.4 pp |
| 5–10 % | 480 | +11 % | –1.8 pp |
| 10–15 % | 650 | +25 % | –3.2 pp |
| **15–20 %** | **420** | **+42 %** | **–4.9 pp** |
| 25 %+ | 210 | +55 % | –8.1 pp |

*Sweet spot appears at 15–20 % discount where elasticity > cost of margin loss.*

### 5.2 Price vs. Quantity Correlation  
- **Pearson r = –0.68** (strong negative).  
- **Inflection**: Demand flattens above $199 for smart-home devices—evidence for **price ceiling**.

---

## 6. Wishlist Intelligence – Hidden Demand  

### 6.1 Top-5 Wishlist Additions
| Product | Adds | Conversion to Order | Gap |
|---|---|---|---|
| Kindle Oasis | 38 k | 4.8 % | 33.2 k |
| AirPods Pro 2 | 35 k | 7.2 % | 28.1 k |
| Meta Quest 3 | 31 k | 5.5 % | 27.0 k |
| Kindle Scribe | 28 k | 3.9 % | 26.9 k |
| PS5 Console | 27 k | 2.1 % | 26.4 k |

*Action*: Trigger “Wishlist Drop” email at 10 % discount—A/B test open-rate uplift (current 22 % → target 35 %).

---

## 7. Geographic Sales – Where to Double-Down  

### 7.1 Revenue by Region (Top-5)
| Region | Sales | YoY | % of Total | CAC | Payback |
|---|---|---|---|---|---|
| **US-California** | $9.4 M | +14 % | 22 % | $28 | 1.2 mo |
| **US-Texas** | $5.7 M | +9 % | 13 % | $31 | 1.4 mo |
| **UK-London** | $4.2 M | +18 % | 10 % | €34 | 1.5 mo |
| **DE-Berlin** | $3.8 M | +22 % | 9 % | €29 | 1.3 mo |
| **US-Florida** | $3.4 M | +6 % | 8 % | $35 | 1.7 mo |

*White-space*: Canada & Nordics combined <$2 M, but high Prime density → launch localized ad campaigns.

---

## 8. Monthly Sales Pulse – Past 12 Months  

| Month | Sales | MoM | Events | Take-away |
|---|---|---|---|---|
| Oct-24 | $4.9 M | +28 % | Prime Day | Record event, but discount 21 % |
| Nov-24 | $5.1 M | +4 % | Black Friday | Cannibalized Dec |
| Dec-24 | $4.4 M | –14 % | Holiday | Post-BF dip |
| Jan-25 | $2.8 M | –36 % | — | Seasonal low—run “New Year, New Tech” |

---

## 9. Profitability Analysis – SKU & Category Level  

| Category | Revenue | Profit | Margin | Top Margin SKU | Bottom Margin SKU |
|---|---|---|---|---|---|
| **Smart Home** | $12.3 M | $3.7 M | 30 % | Echo Show 15 (38 %) | Smart Plug (18 %) |
| **E-Readers** | $8.9 M | $2.9 M | 33 % | Kindle Oasis (40 %) | Basic Kindle (25 %) |
| **Audio** | $7.4 M | $1.9 M | 26 % | Echo Studio (32 %) | Echo Buds (19 %) |
| **Computing** | $6.8 M | $1.2 M | 18 % | Fire Max 11 (27 %) | Fire 7 (11 %) |

*Insight: 6 SKUs drive 47 % of category profit—double marketing weight against these heroes.*

---

## 10. Risk Radar  

| Risk | Evidence | Mitigation |
|---|---|---|
| **Discount Addiction** | 38 % of sales >20 % discount | Tiered loyalty pricing |
| **Inventory Obsolescence** | 1 840 SKUs <50 units | Flash sale & exit |
| **Regional Concentration** | CA+TX = 35 % of revenue | Geo-expansion playbook |
| **Review Deficit** | 27 % of SKUs <10 reviews | Seed review program |

---

## 11. 90-Day Action Plan (OKR Format)  

| Objective | Key Result | Owner | Due |
|---|---|---|---|
| **Boost profitable sales** | GM% ↑ from 22.4 % → 26 % | CFO & Category | WK-12 |
| **Expand high-LTV base** | CLV ↑ $312 → $350 | CRM Lead | WK-12 |
| **Convert hidden demand** | Wishlist conversion ↑ 6.3 % → 10 % | Growth PM | WK-10 |
| **Liquidate slow movers** | $1.9 M inventory → $0.5 M remaining | Supply-Chain | WK-8 |
| **Geo-diversify** | Launch localized campaigns in CA & NO | Intl PMM | WK-6 |

---

## 13. Final Recommendations (TL;DR Checklist)

| # | Recommendation | Owner | Impact (90 d) |
|---|---|---|---|
| 1 | **Cap hero-SKU discounts at 20 %** except Prime Day window | Category Mgmt | +2.3 pp margin |
| 2 | **Liquidate 1 840 long-tail SKUs** via 30 % flash sale + email nurture | Supply-Chain | −$1.4 M inventory |
| 3 | **Tiered consumer pricing**: Gold/Prime 25 %, Silver 30 % | CRM | +$1.1 M profit |
| 4 | **Wishlist trigger campaign** (10 % coupon) for top 5 products | Growth | +3.7 % conversion |
| 5 | **Geo-launch localized ads** in Canada & Nordics (budget $250 k) | Intl Marketing | +$2.2 M revenue |
| 6 | **Bundle high-margin accessories** with Echo Dot & Fire TV | Product Ops | +$800 k profit |
| 7 | **Review seed program**—give 1 000 free units to micro-influencers | Brand | +8 k new reviews |
| 8 | **Early-warning dashboard**—auto-alert when GM% < 10 % | BI | Risk visibility |

---

## 14. Closing Note

> “We’ve proven we can move volume; the next chapter is about moving **value**.  
> Execute the checklist, track the KPIs, and we’ll meet again in 90 days with higher profit and healthier growth.”

