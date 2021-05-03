%% Simulate CFA

function [obs, lat]=SimCFA(Loading,lat_vcov,obs_v,Nsample)

Nfactor=size(Loading,2);
% Generate latent factors
lat=mvnrnd(zeros(1,Nfactor),lat_vcov,Nsample);
Nobs=size(Loading,1);
obs=zeros(Nsample,Nobs);
for i=1:Nobs
    obs(:,i)=lat*Loading(i,:)'+obs_v(i)*randn(Nsample,1);
end
end