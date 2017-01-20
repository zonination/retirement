# How Early can you Retire?

A.K.A. - The Shockingly Simple Math Behind Early Retirement 2: Electric Boogaloo

## About

After reading Mr. Money Moustache's [The Shockingly Simple Math Behind Early Retirement](http://www.mrmoneymustache.com/2012/01/13/the-shockingly-simple-math-behind-early-retirement/), I was inspired to map out various other scenarios. There are some valid criticisms of the piece that I won't dig into, but my main inspiration was a series of questions: "This page assumes I want to live off my pre-retirement budget; What if I wanted to hold off on retiring so I can be mega-comfortable? What if I retire *too early* by mistake or misfortune? Essentially: What would the scenarios look like if I compared the full set of savings rates against the full set of possible years saved?"

## Assumptions

This visualization project (as well as the Mr. Money Moustache article) operates on a set of assumptions that might differ from reality, but are there for the sake of simplicity:

* Your portfolio return is constant 5% *(Reality: It will change year-to-year depending on your mix of US stocks, bonds, international stocks, cash, and market fluctuations)*
* The safe withdrawal rate is 4% *(Reality: This depends on your risk tolerance)*
* Your income never changes *(Reality: Your income will usually increase over time)*
* You will have the same expenses in retirement *(Reality: Your expenses are usually lower in retirement)*
* You can assume that employer match counts as savings in this calculation.
* We're going to ignore debt. *(If you do have high-interest debt, [consider this page](https://www.reddit.com/r/personalfinance/wiki/debt#wiki_what.27s_the_best_way_to_pay_down_my_debt.3F) before investing for retirement.)*
* You will never change your savings rate.
* You will not withdraw the investments until retirement.
* Taxes are not taken into account *(Reality: Your tax situation may be different due to changes in income, changes in politics, or changes in your allocations to certain brokerage accounts e.g. Roth, Traditional, Taxable)*
* Social Security is not taken into account *(Reality: If you are young and live in the US, it's projected that you will still have 75% of the promised benefits of Social Security)*

## Gallery

Retirement age, as a function of your **desired income** and savings rate:
![Image 1](https://raw.githubusercontent.com/zonination/retirement/master/income.png)

The plot above, however, is insufficient. It doesn't consider what you are currently living off of, since *income - savings = budget*. Below is retirement age, as a function of your **desired budget** and savings rate:
![Image 2](https://raw.githubusercontent.com/zonination/retirement/master/budget.png)

## Exploration and Explanations

If you were to ask me, "Zoni, what's more important: my desired income or desired budget?" I would reply with the fact that it's your **desired budget**, because it takes into account what you are living on now vs. surviving after retirement.

A vast majority of us are not going to save 100% of our income, and we'll likely want to call it quits after working from the ages of 20 to 65. So let's assume a max working time of 45 years, a max savings rate of 60%, and replot. In addition to this, let's also mark an area on our plot to highlight what some experts recommend:

* Elizabeth Warren recommends saving 20% of your income in her [50-30-20 rule](https://www.gobankingrates.com/personal-finance/senator-elizabeth-warren-50-30-20-budget-rule-save-pay-off-debt/) (from *All Your Worth: The Ultimate Lifetime Money Plan*)
* William Bernstein recommends saving 15% of your income in his 16-page pamphlet *[If You Can](https://www.etf.com/docs/IfYouCan.pdf)*
* Let's assume their advice is to save for between 35 and 40 years.

![Image 3](https://raw.githubusercontent.com/zonination/retirement/master/altplots/budget-1.png)

There are some financial experts who recommend 10%, but as you can see from a prior plot, you'd need to work a *long* time in order to retire on 1x your budget. Looks like Warren and Bernstein's advice to save 15%-20% is, for a lack of better phrasing, *right on the money*.

How does this look when we add the average US savings rate as a vertical line to the plot?

![Image 4](https://raw.githubusercontent.com/zonination/retirement/master/altplots/budget-2.png)

As of this writing, the [US Personal Savings Rate](http://www.tradingeconomics.com/united-states/personal-savings) is currently 5.5%, however [including employer match](http://www.fool.com/investing/2016/10/03/heres-the-average-americans-savings-rate.aspx) the average thankfully gets a little closer to 8.5%. If these people were relying entirely on their personal savings to retire, that would give them a little less than half their income by the time they come of age. Luckily, for some of these folk, they will have Social Security and pensions, but those are fading as time goes by.

**So here's the key takeaway:** If you are young, and if you can, try to save 15%-20% of your income, minimum (yes: count employer matching as savings). **Pay yourself first.** Pay down expensive debt. Buy and hold (a strategy outlined [here](https://github.com/zonination/investing/blob/master/README.md)) until retirement. Rebalance when needed. Worst case, you end up wealthy.

## Don't agree with these findings?

That's fine; just don't leave before taking a look at them yourself. All the code contained within this repository is open-source. The methods are purely mathematical, so there is no raw data. I've listed the assumptions in the first three lines of code, and the top of this readme.
