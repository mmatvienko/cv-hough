function [centers] = detectCirclesHT(im, radius)       
    % TODO need gaussian?
    % h = fspecial('gaussian', 3, 3);
    gray = rgb2gray(im);
    edges = edge(gray, 'Canny');

    sz = size(gray);
    votes = zeros(sz);
    
    % go through all points in image
    for i=1:sz(1) % height
        for j=1:sz(2) % width
            if edges(i,j) > 0
                curr_votes = zeros(sz);
                % find any points that aren't black and draw circle around
                granularity = 1/radius;
                th = 0:granularity:2*pi;
                y = uint32(i + sin(th).*radius);
                x = uint32(j + cos(th).*radius);
                % cast votes for current circle
                % dont want to simply add 1 to votes b/c coordinates could
                % be overly granular and cast a vote twice
                sz_ = size(th);
                for a=1:sz_(2)
                    if y(a) > 0 && x(a) > 0 && y(a) < sz(1) && x(a) < sz(2) % cast vote in frame
                        curr_votes(y(a), x(a)) = 1;
                    end
                end
                
                % add votes from this circle to main votes
                votes = votes + curr_votes;
            end
        end
    end
    imagesc(votes);
    
    title('votes')
    centers = [100 50; 200 50]
end