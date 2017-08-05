[bhy, bhfs, bhnbits] = wavread('../../../data/rap/rap (10)');
bhy(:,2)=[];
env = EnvelopeExtraction( bhy , bhfs );
autoc = AutoCorrelation( env );
bh = BeatHistogram( autoc );

hist(bh)