import { describe, expect, it } from 'vitest'

import {
  normalizeCategorySlugs,
  resolveCategorySlug,
} from '@/lib/feeds/category-slugs'

describe('category slugs', () => {
  it('maps legacy slugs to current category slugs', () => {
    expect(resolveCategorySlug('islam-alimleri')).toBe('onemli-sahsiyetler')
    expect(resolveCategorySlug('savas-ve-fetihler')).toBe('tarihi-olaylar')
    expect(resolveCategorySlug('dini-gunler')).toBe('dini-gunler')
  })

  it('normalizes subscribe query slugs with legacy aliases', () => {
    expect(
      normalizeCategorySlugs('islam-alimleri,savas-ve-fetihler,dini-gunler'),
    ).toEqual(['dini-gunler', 'onemli-sahsiyetler', 'tarihi-olaylar'])
  })
})
