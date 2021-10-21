part of localized;

const _localizedGender = LocalizedGroup([
  LocalizedText(chs: '男性', jpn: '男性', eng: 'Male'),
  LocalizedText(chs: '女性', jpn: '女性', eng: 'Female'),
  LocalizedText(chs: '其他性别', jpn: 'その他の性別', eng: 'Unknown gender'),
  LocalizedText(chs: '其他', jpn: 'その他の性別', eng: 'Unknown gender'),
]);

const localizedGameClass = LocalizedGroup([
  LocalizedText(chs: '剑阶', jpn: 'セイバー', eng: 'Saber'),
  LocalizedText(chs: '弓阶', jpn: 'アーチャー', eng: 'Archer'),
  LocalizedText(chs: '枪阶', jpn: 'ランサー', eng: 'Lancer'),
  LocalizedText(chs: '骑阶', jpn: 'ライダー', eng: 'Rider'),
  LocalizedText(chs: '术阶', jpn: 'チャスター', eng: 'Caster'),
  LocalizedText(chs: '杀阶', jpn: 'アサシン', eng: 'Assassin'),
  LocalizedText(chs: '狂阶', jpn: 'バーサーカー', eng: 'Berserker'),
  LocalizedText(chs: '裁阶', jpn: 'ルーラー', eng: 'Ruler'),
  LocalizedText(chs: '仇阶', jpn: 'アヴェンジャー', eng: 'Avenger'),
  LocalizedText(chs: '他人格', jpn: '', eng: 'Alterego'),
  LocalizedText(chs: '月癌', jpn: '', eng: 'MoonCancer'),
  LocalizedText(chs: '外阶', jpn: '', eng: 'Foreigner'),
  LocalizedText(chs: '盾阶', jpn: '', eng: 'Shielder'),
  LocalizedText(chs: '兽阶', jpn: '', eng: 'Beast'),
]);

const _localizedSvtFilter = LocalizedGroup([
  LocalizedText(chs: '充能(技能)', jpn: 'NPチャージ(スキル)', eng: 'NP Charge(Skill)'),
  LocalizedText(chs: '充能(宝具)', jpn: 'NPチャージ(宝具)', eng: 'NP Charge(NP)'),
  //['未遭遇', '已遭遇', '已契约']
  LocalizedText(chs: '初号机', jpn: '初号機', eng: 'Primary'),
  LocalizedText(chs: '2号机', jpn: '2号機', eng: 'Replica'),
  // obtain
  LocalizedText(chs: '剧情', jpn: 'ストーリー', eng: 'Story'),
  LocalizedText(chs: '活动', jpn: 'イベント', eng: 'Event'),
  LocalizedText(chs: '无法召唤', jpn: '召唤できない', eng: 'Unsummon'),
  LocalizedText(chs: '常驻', jpn: '恒常', eng: 'Permanent'),
  LocalizedText(chs: '限定', jpn: '限定', eng: 'Limited'),
  LocalizedText(chs: '友情点召唤', jpn: 'フレンドポイント', eng: 'Friendship'),
  //obtains
  LocalizedText(chs: '事前登录赠送', jpn: '', eng: ''),
  LocalizedText(chs: '活动赠送', jpn: 'イベント', eng: 'Event'),
  LocalizedText(chs: '友情点召唤', jpn: 'フレンドポイント', eng: 'Friendship'),
  LocalizedText(chs: '初始获得', jpn: '初期入手', eng: 'Initial'),
  LocalizedText(chs: '无法获得', jpn: '召唤できない', eng: 'Unavailable'),
  LocalizedText(chs: '期间限定', jpn: '期間限定', eng: 'Limited'),
  LocalizedText(chs: '通关报酬', jpn: 'クリア報酬', eng: 'Reward'),
  LocalizedText(chs: '剧情限定', jpn: 'ストーリー限定', eng: 'Story'),
  LocalizedText(chs: '圣晶石常驻', jpn: '恒常召唤', eng: 'Permanent'),
  //
  LocalizedText(chs: '单体', jpn: '单体', eng: 'Single'),
  LocalizedText(chs: '全体', jpn: '全体', eng: 'AoE'),
  LocalizedText(chs: '辅助', jpn: '辅助', eng: 'Support'),
  //
  LocalizedText(chs: '天', jpn: '天', eng: 'Sky'),
  LocalizedText(chs: '地', jpn: '地', eng: 'Earth'),
  LocalizedText(chs: '人', jpn: '人', eng: 'Man'),
  LocalizedText(chs: '星', jpn: '星', eng: 'Star'),
  LocalizedText(chs: '兽', jpn: '獣', eng: 'Beast'),
  //
  LocalizedText(chs: '秩序', jpn: '秩序', eng: 'Lawful'),
  LocalizedText(chs: '混沌', jpn: '混沌', eng: 'Chaotic'),
  LocalizedText(chs: '中立', jpn: '中立', eng: 'Neutral'),
  LocalizedText(chs: '善', jpn: '善', eng: 'Good'),
  LocalizedText(chs: '恶', jpn: '悪', eng: 'Evil'),
  LocalizedText(chs: '中庸', jpn: '中庸', eng: 'Balanced'),
  LocalizedText(chs: '新娘', jpn: '花嫁', eng: 'Bride'),
  LocalizedText(chs: '狂', jpn: '狂', eng: 'Mad'),
  LocalizedText(chs: '夏', jpn: '夏', eng: 'Summer'),
  //

  LocalizedText(chs: '龙', jpn: '龍', eng: 'Dragon'),
  LocalizedText(chs: '骑乘', jpn: '騎乗', eng: 'Riding'),
  LocalizedText(chs: '神性', jpn: '神性', eng: 'Divine'),
  LocalizedText(chs: '猛兽', jpn: '猛獸', eng: 'Wild Beast'),
  LocalizedText(chs: '王', jpn: '王', eng: 'King'),
  LocalizedText(chs: '罗马', jpn: 'ローマ', eng: 'Roman'),
  LocalizedText(chs: '亚瑟', jpn: 'アーサー', eng: 'Arthur'),
  LocalizedText(chs: '阿尔托莉雅脸', jpn: 'アルトリア顔', eng: 'Altria Face'),
  LocalizedText(chs: '呆毛脸', jpn: 'アルトリア顔', eng: 'Altria Face'),
  LocalizedText(chs: 'EA不特攻', jpn: '', eng: 'NOT Weak to Enuma Elish'),
  LocalizedText(chs: '所爱之人', jpn: '愛する者', eng: "Brynhildr's Beloved"),
  LocalizedText(chs: '希腊神话系男性', jpn: 'ギリシャ神話系男性', eng: 'Greek Mythology Males'),
  LocalizedText(chs: '人类的威胁', jpn: '人類の脅威', eng: 'Threat to Humanity'),
  LocalizedText(chs: '阿耳戈船相关人员', jpn: 'アルゴー号ゆかりの者', eng: 'Argo-Related'),
  LocalizedText(chs: '魔性', jpn: '魔性', eng: 'Demonic'),
  LocalizedText(chs: '超巨大', jpn: '超巨大', eng: 'Super Large'),
  LocalizedText(chs: '天地从者', jpn: '', eng: 'Earth or Sky'),
  LocalizedText(chs: '天地(拟似除外)', jpn: '天または地の力を持つサーヴァント', eng: 'Earth or Sky'),
  LocalizedText(chs: '人型', jpn: '人型', eng: 'Humanoid'),
  LocalizedText(chs: '人科', jpn: 'ヒト科', eng: 'Hominidae Servant'),
  LocalizedText(chs: '魔兽型', jpn: '魔獣型', eng: 'Demonic Beast Servant'),
  LocalizedText(chs: '活在当下的人类', jpn: '', eng: 'Living Human'),
  LocalizedText(chs: '巨人', jpn: '', eng: 'Giant'),
  LocalizedText(chs: '孩童从者', jpn: '', eng: 'Children Servants'),
  LocalizedText(chs: '领域外生命', jpn: '', eng: 'Existence Outside the Domain'),
  LocalizedText(chs: '鬼', jpn: '鬼', eng: 'Oni'),
  LocalizedText(chs: '源氏', jpn: '', eng: 'Genji'),
  LocalizedText(chs: '持有灵衣者', jpn: '霊衣を持つ者', eng: 'Costume-Owning'),
  LocalizedText(chs: '机械', jpn: '機械', eng: 'Mechanical'),
  LocalizedText(chs: '妖精', jpn: '妖精', eng: 'Fairy'),
  LocalizedText(chs: '圆桌骑士', jpn: '円卓の騎士', eng: 'Round Table Knight'),
  LocalizedText(chs: '童话特性从者', jpn: '童話特性のサーヴァント', eng: 'Fairy Tale Servant'),

  LocalizedText(chs: '伊莉雅', jpn: 'イリヤ', eng: 'Illya'),
  LocalizedText(chs: '织田信长', jpn: '', eng: 'Nobunaga'),
  LocalizedText(chs: '酒吞童子', jpn: '', eng: 'Shuten Dōji	'),
  LocalizedText(
      chs: '拟似从者和半从者',
      jpn: '擬似サーヴァント、デミ・サーヴァント',
      eng: 'Pseudo-Servants and Demi-Servants'),
  // Localized(chs: '死灵和恶魔', jpn: '死霊と悪魔', eng: 'Undead & Daemon'),

  // Enemy filter
  LocalizedText(chs: '人类', jpn: '', eng: 'Human'),
  LocalizedText(chs: '女性', jpn: '', eng: 'Gender:Female'),
  LocalizedText(chs: '男性', jpn: '', eng: 'Gender:Male'),
  LocalizedText(chs: '野兽', jpn: '', eng: 'Beast'),
  LocalizedText(chs: '恶魔', jpn: '', eng: 'Demon'),
  LocalizedText(chs: '死灵', jpn: '', eng: 'Undead'),
]);
