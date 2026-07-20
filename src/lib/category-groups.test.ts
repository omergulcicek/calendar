import { describe, expect, it } from 'vitest'

import { groupCategoriesForSelect } from './category-groups'

describe('groupCategoriesForSelect', () => {
  const categories = [
    { key: 'besiktas', slug: 'besiktas', name: 'Beşiktaş' },
    { key: 'dini-gunler', slug: 'dini-gunler', name: 'Dini Günler' },
    { key: 'dunya-kupasi', slug: 'dunya-kupasi', name: 'Dünya Kupası' },
    { key: 'fenerbahce', slug: 'fenerbahce', name: 'Fenerbahçe' },
    { key: 'galatasaray', slug: 'galatasaray', name: 'Galatasaray' },
    {
      key: 'sampiyonlar-ligi',
      slug: 'sampiyonlar-ligi',
      name: 'Şampiyonlar Ligi',
    },
    { key: 'trabzonspor', slug: 'trabzonspor', name: 'Trabzonspor' },
    { key: '__none__', slug: null, name: 'Kategorisiz' },
  ]

  it('groups football categories under Futbol', () => {
    const { groups } = groupCategoriesForSelect(categories)
    const futbol = groups.find((group) => group.label === 'Futbol')

    expect(futbol?.categories.map((category) => category.slug)).toEqual([
      'besiktas',
      'fenerbahce',
      'galatasaray',
      'trabzonspor',
      'dunya-kupasi',
      'sampiyonlar-ligi',
    ])
  })

  it('groups religious categories under Din ve İnanç', () => {
    const { groups } = groupCategoriesForSelect(categories)
    const din = groups.find((group) => group.label === 'Din ve İnanç')

    expect(din?.categories.map((category) => category.slug)).toEqual([
      'dini-gunler',
    ])
  })

  it('sorts groups alphabetically by label', () => {
    const { groups } = groupCategoriesForSelect(categories)

    expect(groups.map((group) => group.label)).toEqual([
      'Din ve İnanç',
      'Futbol',
    ])
  })

  it('leaves unknown categories ungrouped', () => {
    const { ungrouped } = groupCategoriesForSelect(categories)

    expect(ungrouped.map((category) => category.key)).toEqual(['__none__'])
  })
})
