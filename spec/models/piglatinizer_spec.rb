describe 'class PigLatinizer' do
  let!(:words) { PigLatinizer.new }


  it 'can create a new instance of a class' do
    expect(PigLatinizer.new).to be_an_instance_of(PigLatinizer)
  end

  it 'piglatinizes an individual word' do
    expect(words.piglatinize("pork")).to eq("orkpay")
    expect(words.piglatinize("i")).to eq("iay")
    expect(words.piglatinize("hello")).to eq("ellohay")
    expect(words.piglatinize("please")).to eq("easeplay")
    expect(words.piglatinize("tomorrow")).to eq("omorrowtay")
    expect(words.piglatinize("until")).to eq("untilay")
    expect(words.piglatinize("this")).to eq("isthay")
    expect(words.piglatinize("enumeration")).to eq("enumerationay")
    expect(words.piglatinize("spray")).to eq("ayspray")
    expect(words.piglatinize("prays")).to eq("ayspray")
  end

  it 'has a method splits the sentence to piglatinize each word' do
    expect(words.piglatinize("i love programming")).to eq("iay ovelay ogrammingpray")
  end

end
